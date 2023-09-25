# *******************
# EXTRACCIÓN DE PARES
# *******************

def extract_evens(values: list[int]) -> list[int]:
    return [num for num in values if num%2==0]

def run(values):
    evens = extract_evens(values)
    return evens

