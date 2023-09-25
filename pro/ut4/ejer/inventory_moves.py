# *************************
# MOVIMIENTOS DE INVENTARIO
# *************************


def run(imoves: str) -> dict:
    # TU CÓDIGO AQUÍ
    inventory = {}
    moves = imoves.split(",")
    # desde aqui la versión de clase
    for move in moves:
        key, *values = move
        values = int("".join(values))
        if key in inventory:
            inventory[key] += values
        else:
            inventory[key] = values
    # versión de clase mucho mejor ( Diego )
    # article = move[0]
    # delta = int(move[1:])
    # inventory[article] = inventory.get(article, 0) + delta

    return inventory


if __name__ == "__main__":
    run("A1,B4,A-2,A7,B1,C4")
