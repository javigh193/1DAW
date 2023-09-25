def find_item(items: tuple, value: int) -> int:
    """Returns the number of ocurrences of a given value within a tuple.
    :param items: tuple composed of any amount of integers
    :type items: tuple
    :param value: the integer to number its ocurrences
    :type value: int

    :return repeat: number of ocurrences of value within items
    :rtype: int
    """
    repeat = 0
    for item in items:
        if item == value:
            repeat += 1
    # con lista por comprensión:
    # repeat = len([item for item in items if item == value])
    return repeat
