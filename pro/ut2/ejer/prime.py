number = input("Introduce un número: ")
number = int(number)
divisors_count = 0
for divisor in range(1, number + 1):
    if (number % divisor) == 0:
        divisors_count += 1
if divisors_count == 2:
    print(f"{number} es primo")
else:
    print(f"{number} no es primo")
