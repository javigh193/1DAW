# *********************
# ORDENE MI DICCIONARIO
# *********************


def run(unsorted_items: dict) -> dict:
    # TU CÓDIGO AQUÍ
    # unsorted_list = unsorted_items.items()
    # sorted_list = []
    # for key_value in unsorted_list:
    #     inser_index = None
    #     if not sorted_list:
    #         sorted_list.append(key_value)
    #     else:
    #         for element in sorted_list:
    #             if key_value[1] < element[1]:
    #                 inser_index = sorted_list.index(element)
    #                 break
    #         if inser_index != None:
    #             sorted_list.insert(inser_index, key_value)
    #         else:
    #             sorted_list.append(key_value)

    # sorted_items = sorted_list
    sorted_items = sorted(
        [(a, b) for a, b in unsorted_items.items()], key=lambda t: t[1]
    )
    print(dict(sorted_items))
    return sorted_items


# la idea era hacerlo teniendo en cuenta los ':'
if __name__ == "__main__":
    run({"a": "two", "b": "one", "c": "three"})
