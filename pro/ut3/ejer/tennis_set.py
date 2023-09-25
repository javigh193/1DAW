# ***************
# UN SET AL TENIS
# ***************


def run(points: str) -> tuple:
    games_player1 = games_player2 = 0
    pointsA = 0
    pointsB = 0
    gamesA = 0
    gamesB = 0
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
                    games_player1 = gamesA
                    games_player2 = gamesB
                    break
            elif pointsB >= 4 and (pointsB - pointsA) >= 2:
                gamesB += 1
                pointsA = pointsB = 0
                if gamesB >= 6 and (gamesB - gamesA) >= 2:
                    games_player1 = gamesA
                    games_player2 = gamesB
                    break
            if gamesA == gamesB == 6:
                tiebrake = True
        else:
            if point == "A":
                pointsA += 1
            else:
                pointsB += 1
            if (pointsA == 6 and (pointsA - pointsB) >= 2) or pointsA == 7:
                gamesA += 1
                games_player1 = gamesA
                games_player2 = gamesB
                break
            elif (pointsB == 6 and (pointsB - pointsA) >= 2) or pointsB == 7:
                gamesB += 1
                games_player1 = gamesA
                games_player2 = gamesB
                break
    return games_player1, games_player2


if __name__ == "__main__":
    run("AABBAABABBBABABABBBAAABBBABAABBABBAABBBABABBAAAABBBBABBBAB")
