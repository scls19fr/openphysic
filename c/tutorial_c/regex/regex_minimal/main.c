/* How to use Regular Expression in C
man regex
regcomp() and regexec()
*/

#include <stdio.h>
#include <regex.h>

//char* str="mardi 10 janvier"; // match
char* str="mardi 10"; // doesn't match
char* pattern="([a-z]+) ([0-9]+) ([a-z]+)";
int err;

int main (void)
{
  regex_t re;

  regcomp(&re, pattern, REG_EXTENDED); /* compile RegEx */

  puts(str);
  puts(pattern);
  
  err=regexec(&re, str, 0, NULL, 0);
  putchar(err);
  if (!err) {
    puts("match");
  } else {
    puts("doesn't match");
  }
  return 0;
}
