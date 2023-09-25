import sys

import pycheck

CHECK_CASES = [
    [[67], 2],
    [[99], 6],
    [[1024], 11],
]


def run(number: int) -> int:
    # TU CÓDIGO AQUÍ
    # todo número es divisor de si mismo y el 1 es divisor de todos los números
    num_divisors = 2
    # como ya contemplo 1 como divisor itero desde 2, números mayores a la mitad no pueden ser divisor
    for div in range(2, number // 2 + 1):
        if number % div == 0:
            num_divisors += 1
    return num_divisors


if __name__ == "__main__":
    pycheck.check(run, CHECK_CASES, sys.argv)
