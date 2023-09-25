# ****************
# SUMANDO COLUMNAS
# ****************
from pathlib import Path


def run(data_path: Path) -> tuple:
    # TU CÓDIGO AQUÍ
    csum = []
    with open(data_path, "r") as f:
        data_rows = f.readlines()
    num_cols = len(data_rows[0].split())
    for _ in range(num_cols):
        csum.append(0)
    for data_row in data_rows:
        cln_data_row = data_row.strip().split()
        # Ayoze usa get para generar un dict
        for i, number in enumerate(cln_data_row):
            csum[i] += int(number)
    csum = tuple(csum)
    return csum


if __name__ == "__main__":
    run("data/sum_cols/data1.txt")
