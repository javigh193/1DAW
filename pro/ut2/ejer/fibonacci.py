value1 = 0
value2 = 1
print(value1)
print(value2)
for _ in range(1, 99):
    sum = value2 + value1
    value1 = value2
    value2 = sum
    print(sum)
# Nuacen hizo una versión con solo un print dentro del for
