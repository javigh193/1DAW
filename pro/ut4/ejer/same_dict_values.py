# ******************************
# VALORES IGUALES EN DICCIONARIO
# ******************************


def run(items: dict) -> bool:
    all_same = True
    if len(items) > 0:
        values = list(items.values())
        if values.count(values[0]) != len(values):
            all_same = False
    return all_same

    # for value in items.values():
    #     if value != last_value:
    #         all_same = False
    #         break
    #     last_value = value


if __name__ == "__main__":
    run({"a": 1, "b": 1, "c": 1, "d": 1})
