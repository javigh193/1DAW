text = "casa"
checked_letters = []
for letter in text.lower:
    if letter in checked_letters:
        print(f"{text} no es un isograma")
        break
    if letter.isalpha():
        checked_letters.append(letter)
else:
    print(f"{text} es un isograma")
# este me costó verlo, intentaba usar índices y no vi el caso de las mayúsculas ni de los caracteres no alfabéticos
