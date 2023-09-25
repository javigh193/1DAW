# ****************
# YELLOW SUBMARINE
# ****************
from pathlib import Path


def run(route_path: Path) -> tuple:
    # TU CÓDIGO AQUÍ
    distance = depth = fuel = 0
    with open(route_path) as f:
        fuel = int(f.readline().strip())
        moves = f.readline().strip().split(",")
        for move in moves:
            dis_var, dep_var = move.split(":")
            dis_var, dep_var = int(dis_var), int(dep_var)
            distance += dis_var
            depth += dep_var
            fuel -= abs(dis_var) * 3
            if depth < 0 or depth > 600 or fuel < 0:
                break

    return distance, depth, fuel


if __name__ == "__main__":
    run("data/submarine/route1.dat")
