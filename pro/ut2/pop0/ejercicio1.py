import sys

import pycheck


def run(text: str) -> str:
    # TU CÓDIGO AQUÍ
    output = ""
    restriction = "aeiou"
    for letter in text:
        # if letter not in "aeiou" and letter not in "AEIOU":
        if letter.lower() not in restriction:
            output += letter
    return output


if __name__ == "__main__":
    pycheck.check("pro.ut2.pop0.ej1", sys.argv, run)
