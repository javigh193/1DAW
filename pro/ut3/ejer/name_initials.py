"""
Dado un nombre y apellidos en formato "apellidos, nombre", obtenga las iniciales de dicha
persona pasadas a mayúsculas y con punto al final.
"""


def run(fullname: str) -> str:
    buffer = []
    fullname = fullname.upper()
    split_fullname = fullname.split(",")
    # split por defecto ya separa utilizando espacios en blanco
    surnames = split_fullname[0].split()
    names = split_fullname[1].strip()
    buffer.append(names)
    buffer.extend(surnames)
    initials = "".join([element[0] + "." for element in buffer])
    return initials


if __name__ == "__main__":
    run("Delgado Quintero, sergio")
