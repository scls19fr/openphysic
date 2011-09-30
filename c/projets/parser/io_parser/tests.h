/* Tests */

#ifndef TESTS_H
#define TESTS_H

char s1[STR_SIZE];
char * s2;


void test_abbreviate(void) {
  /* Test SCPI_Abbreviate */
  /*
  MEASure? -> MEAS?
  MicrocontrollErAS? -> M
  */
  strcpy(s1,"*MEASSSure???ureME");
  s2=SCPI_Abbreviate(s1);
  printf("%s\n",s1);
  printf("%s\n",s2);
}

void tests(void) {
  measure=5;

  /* test_abbreviate(); */
}

#endif
