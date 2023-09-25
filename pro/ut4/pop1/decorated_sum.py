# ****************************
# DECORANDO LA SUMA DE VALORES
# ****************************


def result_as_status(func):
    def wrapper(*args, **kwargs):
        status, result = func(*args, **kwargs)
        return {"status": status, "result": result}

    return wrapper


@result_as_status
def int_add(values: list) -> tuple[bool, int | str]:
    result = 0
    status = True
    for value in values:
        if isinstance(value, int):
            result += value
        else:
            status = False
            result = "Not int value found"
            return status, result
    return status, result


def run(values: list) -> dict:
    return int_add(values)
