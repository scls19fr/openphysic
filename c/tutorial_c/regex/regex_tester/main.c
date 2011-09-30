#include <stdio.h>
#include <string.h>
#include <regex.h>

#define NS 10 /* nb de sous-motifs */

char* str; // = "mardi 29 janvier";
char* pattern; // = "([a-z]+) ([0-9]+) ([a-z]+)";

int main (int argc, char *argv[])
{
  regex_t re;
  regmatch_t subs[NS];
  int err;
    
  if (argc==3) {
    pattern=argv[1];
	str=argv[2];
  
    err=regcomp(&re, pattern, REG_EXTENDED);
	if (!err) {
	  err=regexec(&re, str, (size_t) NS, subs, 0);
	  if (!err) {
	    //printf("oui\n");
		
		size_t len;
		len=(subs[0].rm_eo - subs[0].rm_so);
		if (subs[0].rm_so != -1) {
		  if (len !=0) {
		    printf("-> '%.*s'\n", (int) len, str + subs[0].rm_so);
		  }
		}
		int i;
		for (i=1;i<NS;i++) {
		  if(subs[i].rm_so!=-1) {
		    printf("(%d) '%.*s'\n", i,
			  (int)(subs[i].rm_eo-subs[i].rm_so),
			  str+subs[i].rm_so);
		  }
		}
	  } else {
	    printf("non ! a ne matche pas !\n");
	  }
	}
  }
  
  return 0;
}
