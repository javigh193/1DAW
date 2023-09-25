# ut1-pop1-ej3
VOWELS = 'aeiou'
target_vowel = 'e'
target_offset = 2
input_text = 'Hay una gran diferencia entre conocer el camino y andar el camino'
# No tocar nada de aquí hacia arriba ↑
# ********************************************************

# ========================================================
# @@ Escribe tu código debajo de esta línea ↓
#entiendo del enunciado que el offset estará dentro del rango correcto
#si el texto de entrada no tuviese la vocal a reemplazar el método index daría error
target_index = VOWELS.index(target_vowel)
replacement_index = target_index + target_offset
replacement_vowel = VOWELS[replacement_index]
output_text = input_text.replace(target_vowel, replacement_vowel)
# $$ Escribe tu código encima de esta línea ↑
# ========================================================

# ********************************************************
# No tocar nada de aquí hacia abajo ↓
assert output_text == 'Hay una gran diforoncia ontro conocor ol camino y andar ol camino'