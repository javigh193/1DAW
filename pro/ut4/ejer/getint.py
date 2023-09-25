def getint():
    while True:
        value = input("Give me an integer number:")
        try:
            int(value)
        except ValueError:
            print("Not a valid integer. Try again!")
        else:
            return None


def rgetint():
    value = input("Give me an integer number:")
    try:
        int(value)
    except ValueError:
        print("Not a valid integer. Try again!")
        return rgetint()
    else:
        return None
