input_values = ["this", "is", "a", "real", "real", "story"]
for i, word in enumerate(input_values):
    for comparing_word in input_values[i + 1 :]:
        if word == comparing_word:
            input_values.remove(comparing_word)
print(input_values)
# solución alterantiva con lista auxiliar en la que voy guardando las ocurrencias únicas
