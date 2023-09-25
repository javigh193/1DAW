# ********************
# LEYENDO FICHEROS CSV
# ********************
from pathlib import Path


def run(datafile: Path) -> list:
    # TU CÓDIGO AQUÍ
    data = []
    with open(datafile) as f:
        keys = f.readline().strip().split(",")
        for line in f:
            stats = line.strip().split(",")
            # funciona solo si se da siempre el mismo patrón
            for i in range(3, 11):
                stats[i] = int(stats[i])
            if stats[11] == "True":
                stats[11] = True
            else:
                stats[11] = False
            pokemon = {k: v for k, v in zip(keys, stats)}
            data.append(pokemon)
    return data


if __name__ == "__main__":
    run("data/read_csv/pokemon.csv")
