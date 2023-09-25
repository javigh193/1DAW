import re

text = "Estaré disponible en. El +34755142009 el, lunes por la tarde. Y por la noche. Quizás."
rexp = r"\b[aeiou][a-z]*"
vwl_start_words = re.findall(rexp, text, re.I)
print(vwl_start_words)
