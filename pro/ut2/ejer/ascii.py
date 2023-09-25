initial_char = 33
final_char = 127
row = ""
col = 0
for char in range(initial_char, final_char + 1):
    row += f"{char:03d} {chr(char)}  "  # lo hacía a pelo, sin usar la funcionalidad del f-string
    # print(f'{char:03d}' {chr(char)}', end=' ')
    col += 1  # lo hace con una variable que guarda el número de caracteres representados y a la que aplica módulo % 5 para saltar de fila
    # jorge añade '/n' al string cada 5 chars noooooicee
    if col == 5:
        print(row)
        row = ""
        col = 0
