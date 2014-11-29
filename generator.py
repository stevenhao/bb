

def put(word, grid):
  for i in range(10):
    



"""
  Tries to generate a crossword given a list of words and dimensions
  Arguments:
    words - a list of strings to be used
    width - width of the crossword
    height - height of the crossword
  Returns:
    A 2D matrix of single-character strings,
      representing the generated crossword.
      A ' ' (space character) will represent an empty cell.
    or an empty matrix, if unsuccessful.
"""

def generate(words, width, height):
  grid = [[' '] * width] * height

  for word in words:
    grid = put(word, grid)


print generate().toString()
