#include <stdio.h>
#include <stdint.h>

void print_value(char *operation,uint8_t value) { 
    printf("%s\t = 0x%02X (0b%08b)\n", operation, value, value);
}

int main() {
    uint8_t a = 0xD2; // 0x11010010
    uint8_t b = 0x4F; // 0x01001111
    uint8_t result = 0;


}
