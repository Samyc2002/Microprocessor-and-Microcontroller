#include <AT89C513xA.h>

void delay() {
    int i, j;
    for (i = 0; i < 0xFF; i++)
        for (j = 0; i < 0xFF; j++)
            ;
}

void main() {
    while (1) {
        P1 = 0x80;
        delay();
        P1 = 0x00;
        delay();
        P1 = 0x40;
        delay();
        P1 = 0x00;
        delay();
        P1 = 0x20;
        delay();
        P1 = 0x00;
        delay();
        P1 = 0x10;
        delay();
        P1 = 0x00;
        delay();
    }
}
