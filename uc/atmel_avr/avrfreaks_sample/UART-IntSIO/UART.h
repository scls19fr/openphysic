/* Buffersizes must be 2^n */

#define TBUFSIZE	32
#define RBUFSIZE	32

#define TMASK		(TBUFSIZE-1)
#define RMASK		(RBUFSIZE-1)

#define RBUFLEN		(r_in - r_out)
#define TBUFLEN		(t_in - t_out)

volatile unsigned char tbuf [TBUFSIZE];
volatile unsigned char rbuf [RBUFSIZE];


volatile unsigned char t_in;
volatile unsigned char t_out;

volatile unsigned char r_in;
volatile unsigned char r_out;

int UART_putchar (char c);
int UART_getchar (void);

void UART_first_init (void);
