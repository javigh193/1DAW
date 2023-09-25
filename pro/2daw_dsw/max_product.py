
def max_product(sequence: str, span: int) -> int:
    try:
        int(sequence)
    except:
        raise ValueError("El primer argumento ha de ser un número entero") 
    if span > len(sequence):
        raise ValueError("El segundo argumento no puede ser mayor que el primero")
    if span <= 0:
        raise ValueError("El segundo argumento no puede ser menor o igual a 0")    
    candidates = []
    def calc_candidates(sequence:str, span: int):
        candidates.append(calc_product(sequence[:span]))
        if len(sequence) - span == 0:
            return None
        return calc_candidates(sequence[1:], span)  
    def calc_product(sequence: str) -> int:
        if len(sequence) > 1:
            return int(sequence[0]) * calc_product(sequence[1:])
        return int(sequence[0])
    calc_candidates(sequence, span)
    return max(candidates)



