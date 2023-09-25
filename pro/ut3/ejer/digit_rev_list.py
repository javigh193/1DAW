"""
Dado un número entero no negativo, genere una lista con los dígitos de dicho número
en orden inverso.
"""


def run(number: int) -> list:
    rev_digits = list(str(number))
    rev_digits = rev_digits[::-1]
    for digit in rev_digits:
        int(digit)
    return rev_digits


if __name__ == "__main__":
    run(35231)
