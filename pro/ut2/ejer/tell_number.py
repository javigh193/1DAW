the_number = 7
chances = 0
number = int(input("Introduzca un número: "))
chances += 1
while number != the_number:
    if number > the_number:
        print("El número es menor")
    else:
        print("El número es mayor")
    number = int(input("Introduzca un número: "))
    chances += 1
print(f"¡Enhorabuena!, has encontrado el número en el {chances}º intento.")
