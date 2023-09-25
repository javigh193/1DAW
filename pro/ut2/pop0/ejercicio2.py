import sys

import pycheck


def run(word: str) -> float:
    # TU CÓDIGO AQUÍ
    total_value = 0
    for letter in word:
        total_value += ord(letter)
    char_avg = total_value / len(word)
    return char_avg


if __name__ == "__main__":
    pycheck.check("pro.ut2.pop0.ej2", sys.argv, run)
