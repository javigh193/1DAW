# *****************
# HAN CANTADO LÍNEA
# *****************
from pathlib import Path


def run(input_path: Path, line_no: int) -> str:
    # TU CÓDIGO AQUÍ
    with open(input_path) as f:
        lines = list(f)
    if line_no > 0 and line_no < len(lines):
        line = lines[line_no - 1].strip()
    else:
        line = None
    return line


if __name__ == "__main__":
    run("data/get_line/nasdaq.txt", 20)
