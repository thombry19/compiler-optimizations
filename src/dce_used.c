#include <stdio.h>

int main(void) {
    unsigned long sum = 0;
    for (unsigned long i = 0; i < 2000000000UL; i++) {
        sum += (i * i) ^ (i >> 3);
    }
    printf("sum = %lu\n", sum);
    return 0;
}

// Run: gcc -O2 -o build/dce_used2 src/dce_used.c && time ./build/dce_used2
// (same loop as dce.c, but sum is printed so it must run)