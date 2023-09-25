# *******************
# TEMPERATURAS MEDIAS
# *******************
import filecmp
from pathlib import Path


def run(input_path: Path) -> bool:
    output_path = "data/avg_temps/avg_temps.dat"
    avg_temps = []
    with open(input_path) as f:
        for line in f:
            # temps = line.strip().split(",")
            # temps_sum = 0
            # for temp in temps:
            #     temps_sum += int(temp)
            # avg_temp = temps_sum / len(temps)
            temps_month = [int(t) for t in line.strip().split(",")]
            avg_temp = sum(temps_month) / len(temps_month)
            avg_temps.append(avg_temp)
    with open(output_path, "w") as f:
        for avg_temp in avg_temps:
            f.write(f"{avg_temp:.2f}\n")
    return filecmp.cmp(output_path, "data/avg_temps/.expected", shallow=False)


if __name__ == "__main__":
    run("data/avg_temps/temperatures.dat")
