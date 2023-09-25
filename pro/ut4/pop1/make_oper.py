# *******************
# CREANDO OPERACIONES
# *******************


def make_oper(oper_type: str):
    match oper_type:
        case "add":

            def operation(x: int, y: int) -> int:
                return x + y

        case "sub":

            def operation(x: int, y: int) -> int:
                return x - y

        case "mul":

            def operation(x: int, y: int) -> int:
                return x * y

        case "div":

            def operation(x: int, y: int) -> float:
                return x / y

        case _:

            def operation(*args, **kwargs) -> None:
                return None

    return operation


def run(oper: str, num1: int, num2: int) -> float:
    operation = make_oper(oper)
    result = operation(num1, num2)
    return result
