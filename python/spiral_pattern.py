import random

def generate_spiral_pattern(n):
    # Initialize an empty grid
    grid = [[' ' for _ in range(n)] for _ in range(n)]
    
    # Define the characters to use
    characters = ["@", "#", "$", "%", "&", "*", "+", "~", "-", ".", ":", ";", ",", "`", "^"]
    
    # Start in the middle of the grid
    x, y = n // 2, n // 2
    
    # Initial movement direction
    dx, dy = 0, -1
    
    for i in range(n**2):
        # Assign a random character to the current cell
        grid[x][y] = random.choice(characters)
        
        # Move to the next cell in the current direction
        x, y = x + dx, y + dy
        
        # Check if we need to change direction
        if (x < 0 or x >= n or y < 0 or y >= n or grid[x][y] != ' '):
            # Move back to the previous cell
            x, y = x - dx, y - dy
            # Change direction
            dx, dy = -dy, dx
            # Move to the next cell in the new direction
            x, y = x + dx, y + dy
    
    # Print the grid
    for row in grid:
        print(' '.join(row))

# Example usage
n = 23  # Grid size (should be odd for the spiral to center properly)
generate_spiral_pattern(n)