#include <stdio.h>
#include <stdint.h>

void print_value(char *operation, uint16_t value) { 
    printf("%s\t = 0x%04X (0b%016b)\n", operation, value, value);
}

int main() {
    uint16_t a = 0x5555; // 0x0101010101010101
    uint16_t b = 0xAAAA; // 0x1010101010101010
    uint16_t c = 0x0001; // 0x0000000000000001

    // a | b
    print_value("a | b\t", a | b);

    // a & b
    print_value("a & b\t", a & b);

    // a ^ b
    print_value("a ^ b\t", a ^ b);

    // a & ~b
    print_value("a & ~b\t", a & ~b);

    // c << 6
    print_value("c << 6\t", c << 6);

    // a >> 4
    print_value("a >> 4\t", a >> 4);

    // a & (b << 1)
    print_value("a & (b << 1)", a & (b << 1));

    // b | c
    print_value("b | c\t", b | c);
}
