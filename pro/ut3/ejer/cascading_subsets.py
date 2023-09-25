# ***********************
# SUBCONJUNTOS EN CASCADA
# ***********************


def run(values: list, size: int) -> list:
    # Sergio
    cascading = []
    for i in values[: len(values) - size + 1]:
        cascading.append(values[i : i + size])
    return cascading


# Dimas
# cascading = []
# while len(values) >= size:
#     cascading.append(values[:size])
#     del values[0]
# return cascading


if __name__ == "__main__":
    run([1, 2, 3, 4], 3)
