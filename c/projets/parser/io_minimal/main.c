#include <stdlib.h>
#include <string.h>
#include <stdio.h>

enum _heat_state {
  off,
  on
};
enum _heat_state heat_state = off;
float temp = 22.6;

void set(char *param) {
  if (*param++) {
    if (sscanf(param,"temperature %f",&temp) == 1)
      printf("New temperature set to %3.1f\n", temp);
  }
}

void get(char *param) {
  if (*param++) {
    if (!strcmp("heat",param))
      printf("Heat is %s\n", heat_state?"on":"off");
    if (!strcmp("temperature",param))
      printf("Temperature is %3.1f\n", temp);
  }
}

void heat(char *param) {
  if (*param++) {
    if (!strcmp("on",param))
      heat_state = on;
    if (!strcmp("off",param))
      heat_state = off;
  }
  printf("Heat is set to %s\n", heat_state?"on":"off");
}

typedef struct cmdlist_t {
  char *commandname;
  void (*commandfunc)(char *);
} cmdlist_t;

cmdlist_t cmdlist[] = {
  { "set",  set  },
  { "get",  get  },
  { "heat", heat },
  { NULL,   NULL }
};

int parse(char *cmdline) {
  cmdlist_t *cp = cmdlist;
  while (cp->commandname) {
    if (strstr(cmdline,cp->commandname) == cmdline) {
      cp->commandfunc(cmdline + strlen(cp->commandname));
      return 1;
    }
    cp++;
  }
  return 0;
}

int main(void) {
  parse("get heat");
  parse("heat on");
  parse("get heat");
  parse("heat off");
  parse("get heat");
  parse("get temperature");
  parse("set temperature 32.6");
  parse("get temperature");
    
  return 0;
}
