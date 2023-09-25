# ****************
# SUMANDO MATRICES
# ****************
import filecmp
from pathlib import Path


def run(matrix1_path: Path, matrix2_path: Path) -> bool:
    result_path = "data/sum_matrix/result.dat"
    # TU CÓDIGO AQUÍ
    with open(matrix1_path) as m1:
        with open(matrix2_path) as m2:
            with open(result_path, "w") as res_m:
                for row1, row2 in zip(m1, m2):
                    res_line = ""
                    row1 = row1.strip().split()
                    row2 = row2.strip().split()
                    for el1, el2 in zip(row1, row2):
                        res_line += str(int(el1) + int(el2)) + " "
                    res_m.write(res_line.strip() + "\n")

    return filecmp.cmp(result_path, "data/sum_matrix/.expected", shallow=False)


if __name__ == "__main__":
    run("data/sum_matrix/matrix1.dat", "data/sum_matrix/matrix2.dat")
