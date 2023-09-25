# **************************************************
# IDENTIFICANDO SECUENCIAS CONSECUTIVAS DE UN TAMAÑO
# **************************************************


def consecutive_seq(items: list, target_count: int) -> int:
    length = len(items)
    if length > 1:
        count = 1
        for i in range(length):
            if items[i] == items[i + 1]:
                count += 1
                if count == target_count:
                    return items[i]
            else:
                return consecutive_seq(items[i + 1 :], target_count)
    elif length == target_count == 1:
        return items[0]


# sergio lo saca con una funcion auxiliar interna
