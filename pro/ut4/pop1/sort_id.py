# **********************************
# ORDENANDO IDS EN UNA BASE DE DATOS
# # **********************************


def sort_id(data_base: list) -> list:
    data_base_c = data_base.copy()
    for i, entry in enumerate(data_base_c, start=1):
        entry["id"] = i
    return data_base_c
