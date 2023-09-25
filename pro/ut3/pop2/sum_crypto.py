# ******************
# SUMA CRIPTOGRÁFICA
# ******************
from pathlib import Path


def run(crypto_path: Path) -> float:
    # TU CÓDIGO AQUÍ
    sum_cr = 0.0
    # sería mejor como constante fuera del bloque
    roseta_stone = {
        "sd": "-",
        "vo": ".",
        "ax": "0",
        "gh": "1",
        "hj": "2",
        "uv": "3",
        "ws": "4",
        "pk": "5",
        "et": "6",
        "mc": "7",
        "rh": "8",
        "wb": "9",
    }
    with open(crypto_path, "r") as f:
        data_lines = f.readlines()
    for data_line in data_lines:
        cln_data_line = data_line.strip()
        num = ""
        # solución fea, mejor lista y luego .join, MUTABILIDAD
        for i in range(0, len(cln_data_line), 2):
            code = cln_data_line[i : i + 2]
            num += roseta_stone.get(code, "")
        if num:
            sum_cr += float(num)
    return sum_cr


if __name__ == "__main__":
    run("data/sum_crypto/data1.crypto")
