# ******************
# POTENCIA RECURSIVA
# ******************


def power(x: int, n: int) -> int:
    if n > 0:
        return x * power(x, n - 1)
    return 1
