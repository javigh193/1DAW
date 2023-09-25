# ******************
# POBLACIÓN PROMEDIO
# ******************


def run(pdata: dict) -> dict:
    avg_data = {}
    total_population = sum(pdata.values())
    for city, population in pdata.items():
        avg_data[city] = round((population / total_population * 100), 3)
    return avg_data


if __name__ == "__main__":
    run(
        {"Tokyo": 38140000, "Delhi": 26454000, "Shanghai": 24484000, "Mumbai": 21357000}
    )
