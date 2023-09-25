# *************
# SUMANDO FILAS
# *************
from pathlib import Path


def run(data_path: Path) -> tuple:
    # TU CÓDIGO AQUÍ
    rsum = []
    with open(data_path, "r") as f:
        data_rows = f.readlines()
    for data_row in data_rows:
        # numbers = [int(n) for n in data_row.strip().split()]
        # rsum.append(sum(numbers))
        cln_data_row = data_row.strip().split()
        row_sum = 0
        for number in cln_data_row:
            row_sum += int(number)
        rsum.append(row_sum)
        # hasta aquí
    rsum = tuple(rsum)
    return rsum


if __name__ == "__main__":
    run("data/sum_rows/data1.txt")
