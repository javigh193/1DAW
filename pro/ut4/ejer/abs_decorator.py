# *******************************
# DECORANDO CON VALORES ABSOLUTOS
# *******************************


def fabs(func):
    def wrapper(*args, **kwargs):
        result = func(*args, **kwargs)
        return abs(func(*args, **kwargs))

    return wrapper


@fabs
def fprod(a: int, b: int) -> int:
    return a * b

# fabs_fprod = fabs(fprod)
# print (fabs_fprod(-3, 7))