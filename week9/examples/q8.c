#include <stdio.h>
#include <string.h>
// example usage: ./a.out "チョコミント、よりもあなた！"
// example usage: ./a.out "早上好中国现在我有冰淇淋"
// example usage: ./a.out "🤓🤓🤓🤓🤓🤓🤓🤓"

// 0x80 = 10000000
// 0xC0 = 11000000
// 0xE0 = 11100000
// 0xF0 = 11110000
// 0xF8 = 11111000
int utf8_char_length(unsigned char byte) {
    return 1;
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <string>\n", argv[0]);
        return 1;
    }

}