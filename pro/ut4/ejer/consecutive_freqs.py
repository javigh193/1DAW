# ************************************
# FRECUENCIA DE ELEMENTOS CONSECUTIVOS
# ************************************


def cfreq(items, /, as_string=False):
    # if not items:
    #     if as_string:
    #         return ""
    #     else:
    #         return []
    consec_times = 0  # 1
    freqs = []
    if items:
        last_value = items[0]
        for item in items:
            if item == last_value:
                consec_times += 1
            else:
                freqs.append((last_value, consec_times))
                consec_times = 1
                last_value = item
        freqs.append((last_value, consec_times))
    # for i in range(len(items) - 1):
    #     if items[i] == items[i + 1]:
    #         consec_times += 1
    #         if i == len(items) - 2:
    #             freqs_list.append((items[i], consec_times))
    #     else:
    #         freqs_list.append((items[i], consec_times))
    #         consec_times = 1
    #         if i == len(items) - 2:
    #             freqs_list.append((items[i + 1], consec_times))
    if as_string:
        freqs = ",".join([f"{value}:{freq}" for value, freq in freqs])
    return freqs
    # TU CÓDIGO AQUÍ
