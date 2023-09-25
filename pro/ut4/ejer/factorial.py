# ************************************
# CALCULANDO EL FACTORIAL DE UN NÚMERO
# ************************************


def factorial(n):
    n_fact = 1
    if n < 0:
        n_fact = None
        print("Solo se puede calcular factoriales de números naturales")
    else:
        for i in range(n, 0, -1):
            n_fact *= i
    return n_fact
    # TU CÓDIGO AQUÍ
