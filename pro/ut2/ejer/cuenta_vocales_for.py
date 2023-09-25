word = "Supercalifragilisticoespialidoso"
num_vowels = 0
for letter in word:
    if letter in "aeiou":
        num_vowels += 1
print(num_vowels)
