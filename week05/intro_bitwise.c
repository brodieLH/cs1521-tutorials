#include <stdio.h>
#include <stdint.h>

void print_value(char *operation,uint8_t value) { 
    printf("%s\t = 0x%02X (0b%08b)\n", operation, value, value);
}

int main() {
    uint8_t a = 0xD2; // 0x11010010
    uint8_t b = 0x4F; // 0x01001111
    uint8_t result = 0;

    // Bitwise AND
    result = a & b;
    print_value("a & b", result);
    
    // Bitwise OR
    result = a | b;
    print_value("a | b", result);

    // Bitwise XOR
    result = a ^ b;
    print_value("a ^ b", result);

    // Bitwise NOT
    result = ~a;
    print_value("~a", result);

    // Bitwise LEFT SHIFT
    result = a << 1;
    print_value("a << 1", result);

    // Bitwise RIGHT SHIFT
    result = a >> 1;
    print_value("a >> 1", result);
    
    result = 0;

    // We can also do Bitwise assignment similar to += etc
    result &= a;
    print_value("&= a", result);

    result |= b;
    print_value("|= b", result);

    result ^= a;
    print_value("^= a", result);

    result = ~a;
    print_value("~a", result);

    result = a << 1;
    print_value("a << 1", result);
}
