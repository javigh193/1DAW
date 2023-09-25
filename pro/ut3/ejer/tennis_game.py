# *****************
# UN JUEGO AL TENIS
# *****************


def run(points: str) -> str:
    winner = "No ha ganado el juego ningún jugador aún"
    pointsA = pointsB = 0
    for point in points:
        if point == "A":
            pointsA += 1
        else:
            pointsB += 1
        if pointsA >= 4 and (pointsA - pointsB) >= 2:
            winner = "A"
            break
        elif pointsB >= 4 and (pointsB - pointsA) >= 2:
            winner = "B"
            break
    pointsA = pointsB = 0
    return winner


# en este caso, como solo se juega un juego y se supone que los puntos que nos dan
# son un caso real, podríamos sacar la evaluación del ganador fuera del bucle

if __name__ == "__main__":
    run("ABAABA")
