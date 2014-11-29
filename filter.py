while True:
  try:
    s = raw_input()
    if s.isalpha():
      print s
  except EOFError:
    break

