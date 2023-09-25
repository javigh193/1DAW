"""
Dada una lista de enteros y enteros como cadenas de texto, calcule la suma de todos los
valores de la lista como si todos sus elementos fueran números.
"""


def run(items: list) -> int:
    sum_items = 0
    for item in items:
        if type(item) is str:
            sum_items += int(item)
        else:
            sum_items += item
    return sum_items


# sum_items = sum([int(item) for item in items])
