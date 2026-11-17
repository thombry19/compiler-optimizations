
#include <stdio.h>
#include <stdlib.h>

#define N (1 << 20) /* 1M ints = 4 MB */
#define REPEAT 1000

#ifdef NOINLINE_SCALE
__attribute__((noinline))
#endif
int scale(int x) {
    return x * 3 + 1;
}

int main(void) {
    int* in = malloc(N * sizeof(int));
    int* out = malloc(N * sizeof(int));
    for (int i = 0; i < N; i++) in[i] = i;

    for (int r = 0; r < REPEAT; r++) {
        for (int i = 0; i < N; i++) {
            out[i] = scale(in[i]);
        }
        in[r] = out[r];
    }

    long total = 0;
    for (int i = 0; i < N; i++) total += out[i];
    printf("total = %ld\n", total);

    free(in);
    free(out);
    return 0;
}

// Run: gcc -O2 -o build/inl2 src/inline.c && time ./build/inl2  (add
// -fno-inline to stop scale() from being inlined and compare times)