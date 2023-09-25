# **********************
# ORDENANDO CON BURBUJAS
# **********************


def bubble(items):
    sorted_items = items.copy()
    swaps = True
    while swaps:
        swaps = False
        for i in range(len(sorted_items) - 1):
            if sorted_items[i] > sorted_items[i + 1]:
                sorted_items[i], sorted_items[i + 1] = (
                    sorted_items[i + 1],
                    sorted_items[i],
                )
                swaps = True
    return sorted_items
