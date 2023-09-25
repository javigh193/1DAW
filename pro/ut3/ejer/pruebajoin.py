# sabes el formato de los datos, siempre puedes suponer el orden de partida
input_date = "12/31/20"
splitted_date = input_date.split("/")
ordered_date = []
ordered_date.append(splitted_date[1])
ordered_date.append(splitted_date[0])
# supones que estas en el siglo 21
ordered_date.append(splitted_date[2] * 2)
output_date = "-".join(ordered_date)
print(output_date)
