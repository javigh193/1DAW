# **********************
# BORRANDO VALORES CLAVE
# **********************


def run(items: dict) -> dict:
    citems = {}
    citems = {key: [] for key in items}
    # .clear() no tiene return, por lo que no me sirve para generar elementos por iteración. Modifico los argumentos.
    return citems


if __name__ == "__main__":
    run({"C1": [10, 20, 30], "C2": [20, 30, 40], "C3": [12, 34]})
