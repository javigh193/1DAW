# *********************
# CADA NOTA EN SU SITIO
# *********************


def run(marks: dict) -> tuple:
    passed = failed = {}
    passed = {key.upper(): value for key, value in marks.items() if value >= 5}
    failed = {key.lower(): value for key, value in marks.items() if value < 5}
    print(passed)
    return passed, failed


if __name__ == "__main__":
    run({"Ana": 4, "Domingo": 7, "Eva": 5, "Álvaro": 3, "Juan": 8, "Belén": 1})
