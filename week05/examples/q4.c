#include <stdio.h>
#include <stdint.h>

// If u is 0100 0111 0110 1MMM MMM0 1110 0101 0110 in binary
// We want to extract the 6 middle bits (MMM MMM)
uint32_t six_middle_bits(uint32_t u) {
    return 42; 
}

int main() {
    uint32_t u = 0x12345678;
    printf("six_middle_bits(0x%08X) = 0x%08X\n", u, six_middle_bits(u));
    return 0;
}