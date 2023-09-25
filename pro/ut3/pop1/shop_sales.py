# *******************************
# VENTAS EN TIENDA DE INFORMÁTICA
# *******************************


def run(sales: list) -> tuple:
    pcs = displays = 0
    for day in sales:
        pcs += day[0]
        displays += day[1]
    return pcs, displays


if __name__ == "__main__":
    run([[4, 5], [1, 3], [3, 2]])
