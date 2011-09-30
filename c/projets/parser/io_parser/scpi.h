#ifndef SCPI_H
#define SCPI_H

int SCPI_Parse(char * s);
int SCPI_Compare(char * s1, char * s2);
char * SCPI_Abbreviate (const char *ct);

/* char *str_toupper (const char *ct); */
int contain_number(const char * token);

#endif
