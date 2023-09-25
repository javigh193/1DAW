# *******************************************************
# CALCULANDO EL FACTORIAL DE UN NÚMERO (CON RECURSIVIDAD)
# *******************************************************


def factorial(n: int):
    # TU CÓDIGO AQUÍ
    if n < 0:
        return None
    if n == 0:
        return 1
    return n * factorial(n - 1)
