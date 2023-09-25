# ********************
# LA PALABRA MÁS LARGA
# ********************
from pathlib import Path


def run(input_path: Path) -> str:
    # TU CÓDIGO AQUÍ
    longest_word = ""
    RESTRICTED_CHRS = ".,:;()"
    with open(input_path) as f:
        for line in f:
            max_len = 0
            for char in RESTRICTED_CHRS:
                line = line.replace(char, " ")
            words = line.strip().split(" ")
            for word in words:
                if len(word) >= max_len:
                    max_len = len(word)
                    longest_word = word

    return longest_word


if __name__ == "__main__":
    run("data/longest_word/python.txt")
