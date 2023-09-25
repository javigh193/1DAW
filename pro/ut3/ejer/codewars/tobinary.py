number = 25
binary_coeficients = []
while number >= 1:
    binary_coeficients.append(number % 2)
    number = number // 2
binary_coeficients = "".join([str(element) for element in binary_coeficients[::-1]])
# probo el rendimiento vs reversed() y es casi el doble de peor
print(binary_coeficients)
