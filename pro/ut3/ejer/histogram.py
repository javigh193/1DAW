# **********
# HISTOGRAMA
# **********
import filecmp
from pathlib import Path


def run(data_path: Path) -> bool:
    histogram_path = "data/histogram/histogram.txt"
    # TU CÓDIGO AQUÍ
    freqs = {}
    legend = []
    with open(data_path) as f:
        file = f.read()
    for char in file:
        if char not in freqs:
            freqs[char] = 1
            legend.append(char)
        else:
            freqs[char] += 1
    legend.sort()
    with open(histogram_path, "w") as f:
        for row in legend:
            f.write(f"{row} {'█' * freqs[row]} {freqs[row]}\n")
    return filecmp.cmp(histogram_path, "data/histogram/.expected", shallow=False)


if __name__ == "__main__":
    run("data/histogram/data.txt")
