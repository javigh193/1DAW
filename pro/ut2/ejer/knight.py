objetivo_x = 8
objetivo_y = 8
if abs(objetivo_x - objetivo_y) != 1:
    print("Posición demasiado compleja, no te pases!")
else:
    x = 0
    y = 0
    flag = True
    moves = ""
    while x < objetivo_x and y < objetivo_y:
        if flag:
            x += 1
            y += 2
            flag = False
        else:
            x += 2
            y += 1
            flag = True
        moves = moves + f"({x},{y})" + " "
    if x == objetivo_x and y == objetivo_y:
        print(moves)
    else:
        flag = 1
        x = 0
        y = 0
        moves = ""
        while x < objetivo_x and y < objetivo_y:
            if not flag:
                x += 1
                y += 2
                flag = True
            else:
                x += 2
                y += 1
                flag = False
            moves = moves + f"({x},{y})" + " "
        print(moves)
