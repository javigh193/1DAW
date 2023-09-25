# ***************
# TUPLA DE DUPLAS
# ***************


def run(input: tuple) -> set:
    # TU CÓDIGO AQUÍ
    set1 = set()
    set2 = set()
    for item1, item2 in input:
        set1.add(item1)
        set2.add(item2)
    output = (set1, set2)
    return output


if __name__ == "__main__":
    run(((4, 3), (8, 2), (7, 5), (8, 2), (9, 1)))
