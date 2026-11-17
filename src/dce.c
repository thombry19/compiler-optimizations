#include <stdio.h>

int main(void) {
    unsigned long sum = 0;
    for (unsigned long i = 0; i < 2000000000UL; i++) {
        sum += (i * i) ^ (i >> 3);
    }
    /* sum is never read, so all of the work above is "dead". */
    printf("done\n");
    return 0;
}

// Run: gcc -O2 -o build/dce2 src/dce.c && time ./build/dce2  (loop result is
// unused, so -O2 deletes it)