#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define WIDTH 40
#define HEIGHT 20
#define GENERATIONS 100
#define ALIVE 'O'
#define DEAD ' '

void initialize_grid(char grid[HEIGHT][WIDTH]) {
    for (int i = 0; i < HEIGHT; i++) {
        for (int j = 0; j < WIDTH; j++) {
            grid[i][j] = rand() % 2 ? ALIVE : DEAD;
        }
    }
}

void print_grid(char grid[HEIGHT][WIDTH]) {
    for (int i = 0; i < HEIGHT; i++) {
        for (int j = 0; j < WIDTH; j++) {
            printf("%c", grid[i][j]);
        }
        printf("\n");
    }
}

int count_alive_neighbors(char grid[HEIGHT][WIDTH], int x, int y) {
    int count = 0;
    for (int i = -1; i <= 1; i++) {
        for (int j = -1; j <= 1; j++) {
            if (i == 0 && j == 0) continue;
            int nx = x + i;
            int ny = y + j;
            if (nx >= 0 && nx < HEIGHT && ny >= 0 && ny < WIDTH) {
                if (grid[nx][ny] == ALIVE) count++;
            }
        }
    }
    return count;
}

void update_grid(char grid[HEIGHT][WIDTH], char new_grid[HEIGHT][WIDTH]) {
    for (int i = 0; i < HEIGHT; i++) {
        for (int j = 0; j < WIDTH; j++) {
            int alive_neighbors = count_alive_neighbors(grid, i, j);
            if (grid[i][j] == ALIVE) {
                if (alive_neighbors < 2 || alive_neighbors > 3) {
                    new_grid[i][j] = DEAD;
                } else {
                    new_grid[i][j] = ALIVE;
                }
            } else {
                if (alive_neighbors == 3) {
                    new_grid[i][j] = ALIVE;
                } else {
                    new_grid[i][j] = DEAD;
                }
            }
        }
    }
}

void copy_grid(char source[HEIGHT][WIDTH], char destination[HEIGHT][WIDTH]) {
    for (int i = 0; i < HEIGHT; i++) {
        for (int j = 0; j < WIDTH; j++) {
            destination[i][j] = source[i][j];
        }
    }
}

int main() {
    char grid[HEIGHT][WIDTH];
    char new_grid[HEIGHT][WIDTH];

    srand((unsigned int)time(NULL));

    initialize_grid(grid);

    for (int generation = 0; generation < GENERATIONS; generation++) {
        printf("Generation %d:\n", generation);
        print_grid(grid);
        update_grid(grid, new_grid);
        copy_grid(new_grid, grid);
        usleep(200000); // Sleep for 200 milliseconds
        system("clear"); // Clear the screen (Linux/Unix)
    }

    return 0;
}
