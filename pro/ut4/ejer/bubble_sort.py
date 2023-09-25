# **********************
# ORDENANDO CON BURBUJAS
# **********************

# def bubble(items: list) -> list:
#     sorted_items = items.copy()
#     swaps = True
#     while swaps:
#         swaps = False
#         for i in range(len(sorted_items) - 1):
#             if sorted_items[i] > sorted_items[i + 1]:
#                 sorted_items[i], sorted_items[i + 1] = (
#                     sorted_items[i + 1],
#                     sorted_items[i],
#                 )
#                 swaps = True
#     return sorted_items

def copy_input(func):
    def wrapper(input: list) -> list:
            c_input = input.copy()
            return func(c_input)
    return wrapper

@copy_input
def bubble(items: list) -> list:
    swaps = True
    while swaps:
        swaps = False
        for i in range(len(items) - 1):
            if items[i] > items[i + 1]:
                items[i], items[i + 1] = (
                    items[i + 1],
                    items[i],
                )
                swaps = True
    return items

items = [4, 9, 5, 1]

print(bubble(items), items)
