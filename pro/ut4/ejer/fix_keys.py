# ********************
# LA CLAVE ES LA CLAVE
# ********************


def run(items: dict) -> dict:
    # for key, value in items.items():
    #     new_key = key.replace(" ", "")
    #     fitems[new_key] = value
    fitems = {key.replace(" ", ""): value for key, value in items.items()}
    return fitems


if __name__ == "__main__":
    run({"S  001": ["Math", "Science"], "S    002": ["Math", "English"]})
