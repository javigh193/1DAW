# *******************************
# CONTANDO VOCALES (EN RECURSIVO)
# *******************************

vowels = {"a", "e", "i", "o", "u"}

# lo que se me ocurrio
# def count_vowels(text: str, num_vowels: int = 0) -> int:
#     if text[0] in vowels:
#         num_vowels += 1
#     if len(text) == 1:
#         return num_vowels
#     return count_vowels(text[1:], num_vowels)
#
# solucion de Sergio
def count_vowels(text: str) -> int:
    if len(text) == 1:
        if text[0] in vowels:
            return 1
        return 0
    return count_vowels(text[0]) + count_vowels(text[1:])
