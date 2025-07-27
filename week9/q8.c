#include <stdio.h>
#include <string.h>

int utf8_char_length(unsigned char byte) {
    if ((byte & 0x80) == 0) return 1;             // 0x80 = 10000000 
                                                  // 0xC0 = 11000000
    else if ((byte & 0xE0) == 0xC0) return 2;     // 0xE0 = 11100000
    else if ((byte & 0xF0) == 0xE0) return 3;     // 0xF0 = 11110000
    else if ((byte & 0xF8) == 0xF0) return 4;     // 0xF8 = 11111000
    else return -1; 
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <string>\n", argv[0]);
        return 1;
    }

    int count = 0;
    char *utf8_string = argv[1];

    for (int i = 0; utf8_string[i] != '\0'; i++) {
        int len = utf8_char_length(utf8_string[i]);
        count++;

        // As we are already at the first byte we are just skipping continuation bytes.
        i += (len - 1);
    }

    // Alternative way using pointer arithmetic:
    // for (char *c = utf8_string; *c != '\0'; c++) {
    //     int len = utf8_char_length(*c);
    //     count++;

    //     c += (len - 1);
    // }
    
    printf("The strlen of this input is %zu\n", strlen(utf8_string));

    printf("there are %d codepoints in the string\n", count);
    return 0;
}