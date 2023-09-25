# ***********************************
# ¿DÓNDE ESTÁN LAS PALABRAS? MATARILE
# ***********************************
from pathlib import Path


def run(data_path: Path, target_word: str) -> list:
    # TU CÓDIGO AQUÍ
    RESTRICTED_CHRS = ".,:;()'¡!-"
    matches = []
    row = 0
    target_word = target_word.lower()
    with open(data_path) as in_f:
        for line in in_f:
            row += 1
            line = line.lower()
            for char in RESTRICTED_CHRS:
                line = line.replace(char, " ")
            clean_line = line.replace("\n", " ")
            times = line.count(target_word)
            carry = 0
            for _ in range(times):
                # la primera columna es 1, no 0
                col = line.index(target_word) + carry + 1
                carry = col + len(target_word) - 1
                prev_char = clean_line[col - 2]
                next_char = clean_line[carry]
                if prev_char == next_char == " ":
                    position = (row, col)
                    matches.append(position)
                line = line[carry:]
    # Nua lo hizo en nada sin usar index enumerate
    return matches


if __name__ == "__main__":
    run("data/find_words/bzrp.txt", "persona")
