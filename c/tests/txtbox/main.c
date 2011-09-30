#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>

// Clear screen
//#define CLS system("cls")
#define CLS system("clear")

// PAUSE
#define PAUSE getchar()

#define KEYPAD_UP 'z'
#define KEYPAD_DOWN 'w'
#define KEYPAD_LEFT 'q'
#define KEYPAD_RIGHT 's'
#define KEYPAD_OK 'y'
#define KEYPAD_CANCEL 'n'

//#define MAX_STRING_LENGTH 16
typedef struct _uTxtBox uTxtBox;
struct _uTxtBox {
  uint8_t cursor;
  uint8_t txt_size;
  //char txt[MAX_STRING_LENGTH]; //?
  char txt[]; //? set_txtbox_txtsize
};

void init_txtbox(uTxtBox * txtbox) {
  uint8_t i;
  i = 0;
  for(i = 0 ; i<txtbox->txt_size ; i++) {
    txtbox->txt[i] = '\0';
  }

  /* for tests */
  txtbox->txt[0]='A';
  txtbox->txt[1]='B';
  txtbox->txt[2]='C';
  txtbox->txt[3]='D';
  txtbox->txt[4]='E';
  txtbox->txt[5]='F';
  txtbox->txt[6]='G';
  txtbox->txt[7]='H';
}

void show_txtbox(uTxtBox * txtbox) {
  uint8_t i;
  i = 0;
  for(i = 0 ; i<txtbox->txt_size ; i++) {
    if (txtbox->txt[i]!='\0') {
      printf("%c",txtbox->txt[i]);
    } else {
      printf("_");
    }
  }
}

void set_next_cursor(uTxtBox * txtbox) {
  if ( txtbox->cursor == txtbox->txt_size ) {//-1 ) {
    txtbox->cursor = 0;
  } else {  
    (txtbox->cursor)++;
  }
}

void set_previous_cursor(uTxtBox * txtbox) {
  if ( txtbox->cursor == 0 ) {
    txtbox->cursor = txtbox->txt_size; //-1;
  } else {  
    (txtbox->cursor)--;
  }
}

char get_next_char(char c) {
  char nc;
  nc = '\0';
  //A
  if (c=='Z') { // A..Z a..z 0..9 \0
    nc = 'a';
  } else if (c=='z') {
    nc = '0';
  } else if (c=='9') {
    nc = '\0';
  } else if (c=='\0') {
    nc = 'A';
  } else {
    nc = ++c;
  }
  return nc;
}

char get_previous_char(char c) {
  char pc;
  pc = '\0';
  //\0
  if (c=='\0') { // \0 9..0 z..a Z..A
    pc = '9';
  } else if (c=='0') {
    pc = 'z';
  } else if (c=='a') {
    pc = 'Z';
  } else if (c=='A') {
    pc = '\0';
  } else {
    pc = --c;
  }
  return pc;
}

void on_txtbox_keypad_up(uTxtBox * txtbox) {
  if ( txtbox->cursor >= 1) {
    txtbox->txt[txtbox->cursor-1] = get_next_char(txtbox->txt[txtbox->cursor-1]);
  } else {
    printf("focus up");
  }
}

void on_txtbox_keypad_down(uTxtBox * txtbox) {
  if ( txtbox->cursor >= 1) {       
    txtbox->txt[txtbox->cursor-1] = get_previous_char(txtbox->txt[txtbox->cursor-1]);
  } else {
    printf("focus down");
  }
}

void update_key_pressed(uTxtBox * txtbox) {
  char key;
  key = 0;
  
  while(key!=KEYPAD_OK && key!=KEYPAD_CANCEL
	&& key!=KEYPAD_UP && key!=KEYPAD_DOWN
	&& key!=KEYPAD_RIGHT && key!=KEYPAD_LEFT) { 
    
    /* key = getch(); */ /* conio.h */
    key = getchar(); /* stdio.h */
    /* scanf("%c",&key); */
    
    switch(key) {
    case KEYPAD_OK:
      
      break;
    case KEYPAD_CANCEL:
      
      break;
    case KEYPAD_UP:
      on_txtbox_keypad_up(txtbox);
      break;
    case KEYPAD_DOWN:
      on_txtbox_keypad_down(txtbox);
      break;
    case KEYPAD_LEFT:
      set_previous_cursor(txtbox);
      break;
    case KEYPAD_RIGHT:
      set_next_cursor(txtbox);
      break;           
    default:
      
      break;
    }
  }
}

int main(void)
{
  uTxtBox txtbox;
  (&txtbox)->cursor = 0;
  (&txtbox)->txt_size = 8;
  init_txtbox(&txtbox);

  while(1) {
    CLS;
    show_txtbox(&txtbox);
    printf(" : %i ",(&txtbox)->cursor); /* FOR TEST : cursor position */
    update_key_pressed(&txtbox);
    printf("\n");
   }
  PAUSE;
  return 0;
}


