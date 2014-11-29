def is_good(word):
  word = word.lower()
  for c in word:
    if not c.isalpha():
      return False
  else:
    return True

while True:
  try:
    s = raw_input()
    if is_good(s):
      print s
  except EOFError:
    break

