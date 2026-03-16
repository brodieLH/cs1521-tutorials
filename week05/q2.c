#include <stdio.h>

int main() {
    printf("Decimal\t\tBinary\t\tHexa\t\tOctal\n");

    int nums[8] = {1, 8, 10, 15, 16, 100, 127, 200};
    for (int i = 0; i < 8; i++) {\
        if (nums[i] < 100) {
            printf("%d\t\t0b%b\t\t0x%x\t\t0%o\n", nums[i], nums[i], nums[i], nums[i]);
        } else {
            printf("%d\t\t0b%b\t0x%x\t\t0%o\n", nums[i], nums[i], nums[i], nums[i]);
        }
    }
    
    return 0;
}