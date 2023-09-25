# ********************
# ORDENANDO POR EDADES
# ********************


def make_sort_any(iterable: list | str):
    if isinstance(iterable, list):

        def sort_any(items: list) -> list:
            return sorted(items)

    elif isinstance(iterable, str):

        def sort_any(items: str) -> str:
            return "".join(sorted(items))

    return sort_any


my_iterable1 = "abghijg"
my_iterable2 = [1, 4, 5, 6, 2, 3]
sort_any1 = make_sort_any(my_iterable1)
sort_any2 = make_sort_any(my_iterable2)
print(sort_any1(my_iterable1), sort_any2(my_iterable2))

# def run(people: list) -> list:
#     #speople = sorted(people, key=lambda d: d["age"])
#     return speople


# if __name__ == "__main__":
#     run(
#         [
#             {"name": "DeRozan", "age": 33},
#             {"name": "Lonzo", "age": 25},
#             {"name": "Beverly", "age": 34},
#             {"name": "Dragic", "age": 36},
#             {"name": "Williams", "age": 21},
#         ]
#     )
