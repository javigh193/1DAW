def run(points: str) -> str:
    # supongo tiebrake a 7 y partido a 5 sets
    winner = "No ha ganado el partido ningún jugador aún"
    pointsA = 0
    pointsB = 0
    gamesA = 0
    gamesB = 0
    setA = 0
    setB = 0
    score = []
    tiebrake = False
    for point in points:
        if not tiebrake:
            if point == "A":
                pointsA += 1
            else:
                pointsB += 1
            if pointsA >= 4 and (pointsA - pointsB) >= 2:
                gamesA += 1
                pointsA = pointsB = 0
                if gamesA >= 6 and (gamesA - gamesB) >= 2:
                    setA += 1
                    score.append([gamesA, gamesB])
                    gamesA = gamesB = 0
                    if setA == 3:
                        winner = "A"
                        setA = setB = 0
            elif pointsB >= 4 and (pointsB - pointsA) >= 2:
                gamesB += 1
                pointsA = pointsB = 0
                if gamesB >= 6 and (gamesB - gamesA) >= 2:
                    setB += 1
                    score.append([gamesA, gamesB])
                    gamesA = gamesB = 0
                    if setB == 3:
                        winner = "B"
                        setA = setB = 0
            if gamesA == gamesB == 6:
                tiebrake = True
        else:
            if point == "A":
                pointsA += 1
            else:
                pointsB += 1
            if (pointsA == 6 and (pointsA - pointsB) >= 2) or pointsA == 7:
                gamesA += 1
                score.append([gamesA, gamesB])
                setA += 1
                tiebrake = False
                pointsA = pointsB = gamesA = gamesB = 0
                if setA == 3:
                    winner = "A"
                    setA = setB = 0
            elif (pointsB == 6 and (pointsB - pointsA) >= 2) or pointsB == 7:
                gamesB += 1
                score.append([gamesA, gamesB])
                setB += 1
                tiebrake = False
                pointsA = pointsB = gamesA = gamesB = 0
                if setB == 3:
                    winner = "B"
                    setA = setB = 0

    print(f"Gana el jugador {winner} con el siguiente resultado: ")
    print(score)
    for set in score:
        print(f"{set[0]} - {set[1]}")

    return winner


run(
    "AABAABABBABAAABABBBAABABABABABABABBBBABBABAAAAABBAABAABBABBAABBAAABBBAABAAABBBBABABAAABAAABAABABBABAAABABBBAABABABABABABABBBBABBABAAAAABBAABAABBABBAABBAAABBBAABAAABBBBABABAAABAAABAABABBABAAABABBBAABABABABABABABBBBABBABAAAAABBAABAABBABBAABBAAABBBAABAAABBBBABABAAABA"
)
