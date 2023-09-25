values = [1, 1, 1, 1, 1, 1]
"""
if values.count(values[0]) == len(values):
    print("Sus valores son iguales")
else:
    print("Sus valores no son iguales")
"""
# y ahora recorriendo, comenzando desde el siguiente elemento a comparar
for value in values[1:]:
    if values[0] != value:
        print("Son distintos")
        break
else:
    print("Son iguales")
