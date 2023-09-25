# Dada una lista de strings, obtenga otra lista que contenga todos los caracteres de cada
# uno de los strings de la lista de entrada.


def run(texts: list) -> list:
    # TU CÓDIGO AQUÍ
    chars = []
    for element in texts:
        chars.extend(element)
    return chars
