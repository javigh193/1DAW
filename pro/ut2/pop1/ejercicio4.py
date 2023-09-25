import sys

import pycheck

CHECK_CASES = [
    [[67, 23], (88, 44)],
    [[50, 20], (60, 30)],
    [[28, 4], (48, 24)],
]


def run(mother_age: int, daughter_age: int) -> tuple:
    # TU CÓDIGO AQUÍ
    target_mother_age = mother_age
    target_daughter_age = daughter_age
    # Si la edad de la hija es mayor que la mitad de la de la madre, el bucle no pararía
    if target_daughter_age <= target_mother_age / 2:
        while target_mother_age / target_daughter_age != 2:
            target_mother_age += 1
            target_daughter_age += 1
    else:
        print("Nunca se dará que la edad de la madre sea el doble que la de la hija")
    return target_mother_age, target_daughter_age


if __name__ == "__main__":
    pycheck.check(run, CHECK_CASES, sys.argv)
