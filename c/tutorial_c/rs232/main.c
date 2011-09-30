#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <termios.h>

#define PORT "/dev/tty0"

int main()
{
    int fd;
    char c;
    struct timeval tv;
    struct termios tty;

    fd = open(PORT, O_RDWR | O_NOCTTY);
    if (fd < 0) {
        fprintf(stderr,"Can't open %s\n", PORT);
        perror("Error");
        exit(1);
    }

    /* 9600 bauds, 8bits, 1 bit de stop, pas de parité */
    bzero(&tty, sizeof(tty));
    tty.c_cflag = CLOCAL | CS8 | CSTOPB;
    cfsetospeed(&tty, B9600);
    cfsetispeed(&tty, B9600);
    tcflush(fd, TCIFLUSH);
    tcsetattr(fd, TCSANOW, &tty);

    /* lecture */
    fd_set rfds;
    int encore = 1;
    while (encore)
    {
        FD_ZERO(&rfds);
        FD_SET(fd, &rfds);     /* pour surveiller fd */
        tv.tv_sec  = 5;        /* timeout 5 secondes */
        tv.tv_usec = 0;        /* + 0 microsecondes  */
        if (select(fd+1, &rfds, NULL, NULL, &tv)) {
            read(fd, &c, 1);
            printf("%c", c); fflush(stdout);    /* pour voir */
                /* ... */
                /* tes calculs à toi ici */
                /* ... */
        }
        else {
            printf("timeout\n");
            encore = 0;   /* bye */
        }
    }
    return 0;
} 
