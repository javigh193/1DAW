# ***********************
# REEMPLAZO DE CARACTERES
# ***********************
import filecmp
from pathlib import Path


def run(input_path: Path, replacements: str) -> bool:
    output_path = "data/replace_chars/r_noticia.txt"
    # TU CÓDIGO AQUÍ
    replace_pairs = replacements.strip().split("|")
    with open(input_path) as f:
        file = f.read()
        for old_char, new_char in replace_pairs:
            file = file.replace(old_char, new_char)
    with open(output_path, "w") as f:
        f.write(file)

    return filecmp.cmp(output_path, "data/replace_chars/.expected", shallow=False)


if __name__ == "__main__":
    run("data/replace_chars/noticia.txt", "áa|ée|íi|óo|úu")
