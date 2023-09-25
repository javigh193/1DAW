# *******************
# GENERANDO CUADRADOS
# *******************


def gen_sq(n: int):
    def sq_gen(n: int):
        for i in range(0, n):
            yield i**2

    return list(sq_gen(n))
