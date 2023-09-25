# ***********************
# SUMANDO CON ANIDAMIENTO
# ***********************

test_case = [1, [2, 4], 5, [6, [7, 8]]]

def sum_nested(items: list) -> int:
    sum = 0
    for item in items:
        if isinstance(item, list):
            sum += sum_nested(item)
        else:
            sum += item
    return sum
