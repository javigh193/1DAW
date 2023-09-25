import re

text = "https://aprendepython.es/stdlib/text_processing/re/, hola y adiós, http://developer.mozilla.org/es/docs/Learn/Common_questions/Web_mechanics/What_is_a_URL."
rexp = r"\b(https?://[^\s,]*)"
urls = re.findall(rexp, text)
print(urls)
