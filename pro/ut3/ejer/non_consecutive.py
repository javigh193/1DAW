"""
El objetivo es encontrar el primer número no consecutivo dentro de una lista de valores
numéricos enteros. Si todos los valores son consecutivos entonces el resultado es None.
"""


def run(values: list) -> int:
    for i in range(len(values) - 1):
        if values[i + 1] != values[i] + 1:
            target = values[i + 1]
            break
    else:
        target = None
    return target


if __name__ == "__main__":
    run([1, 2, 3, 4, 6, 7, 8])
