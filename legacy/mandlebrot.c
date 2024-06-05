#include <stdio.h>
#include <complex.h>

#define WIDTH 80
#define HEIGHT 40
#define MAX_ITER 1000
#define X_MIN -2.0
#define X_MAX 1.0
#define Y_MIN -1.0
#define Y_MAX 1.0

int mandelbrot(complex double c) {
    complex double z = 0;
    int n = 0;
    while (cabs(z) <= 2 && n < MAX_ITER) {
        z = z*z + c;
        n++;
    }
    return n;
}

void generate_mandelbrot() {
    for (int y = 0; y < HEIGHT; y++) {
        for (int x = 0; x < WIDTH; x++) {
            double real = X_MIN + x * (X_MAX - X_MIN) / WIDTH;
            double imag = Y_MIN + y * (Y_MAX - Y_MIN) / HEIGHT;
            complex double c = real + imag * I;
            int n = mandelbrot(c);
            
            if (n == MAX_ITER) {
                printf("#");
            } else if (n > MAX_ITER / 2) {
                printf("O");
            } else if (n > MAX_ITER / 4) {
                printf("o");
            } else if (n > MAX_ITER / 8) {
                printf(".");
            } else {
                printf(" ");
            }
        }
        printf("\n");
    }
}

int main() {
    generate_mandelbrot();
    return 0;
}
