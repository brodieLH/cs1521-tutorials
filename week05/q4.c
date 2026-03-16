#include <stdio.h>
#include <stdint.h>

uint32_t six_middle_bits(uint32_t u) {
    return (u >> 13) & 0x3F;
    
    // EXAMPLE

    // u is 0100 0111 0110 1MMM MMM0 1110 0101 0110 in binary
    // The MIDDLE BITS have been represented with M
    // The rest of the bits are made up and arbitrary.
    // The bit mask, 0x3F, is 0011 1111 (ie. last 6 bits are 1)

    // Shifting u by 13 bits to the right gets it to the end, ie.
    // u = 0000 0000 0000 0010 0011 1011 01MM MMMM

    // When ANDed (&) together with the mask, we ONLY get the last 
    // 6 bits in u, which are the ORIGINAL (preshift) 6 middle bits.
    // result = 0000 0000 0000 0000 0000 0000 00MM MMMM
}

int main() {
    uint32_t u = 0x12345678;
    printf("six_middle_bits(0x%08X) = 0x%08X\n", u, six_middle_bits(u));
    return 0;
}