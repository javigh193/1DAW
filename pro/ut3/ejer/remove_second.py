"""
Dada una lista, genere otra lista eliminando el segundo elemento de forma repetida.
"""


def run(items: list) -> list:
    filter = []
    for i, item in enumerate(items):
        if (i + 1) % 2 != 0:
            filter.append(item)
    return filter


# Eloy lo resuelve con un for sencillo:
# for i in range len(0, items, 2):
#       filter.append(items[i])
# Otra forma:
# filter = items[::2]
