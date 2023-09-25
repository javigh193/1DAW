# **********************
# FRECUENCIA DE PALABRAS
# **********************
from pathlib import Path


def run(input_path: Path, lower_bound: int) -> dict:
    # TU CÓDIGO AQUÍ
    freq = {}
    with open(input_path) as f:
        words = f.read().strip().lower().split()
        for word in words:
            w_freq = words.count(word)
            if w_freq >= lower_bound:
                freq[word] = w_freq
    return freq


if __name__ == "__main__":
    run("data/word_freq/cistercian.txt", 9)
