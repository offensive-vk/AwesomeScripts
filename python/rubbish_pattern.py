import random

def generate_pattern(rows, cols):
    for i in range(rows):
        line = ""
        for j in range(cols):
            if (i + j) % 2 == 0:
                line += random.choice(["@", "#", "$", "%", "&", "*", "+", "~"])
            else:
                line += random.choice([" ", "-", ".", ":", ";", ",", "`", "^"])
        print(line)

# Example usage
rows = 20   
cols = 40
generate_pattern(rows, cols)
