text = "cadenade ejemp576w6"
# for position in range(len(text)):
#    if not text[position].isalpha():
for letter in text:
    if letter.isalpha():
        print("Se han encontrado caracteres no alfabéticos.")
        break
else:
    print("No se han encontrado caracteres no alfabéticos.")
