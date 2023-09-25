# ***************
# CUADRADO MÁGICO
# ***************


def is_magic_square(matrix: list[list]) -> bool:
    # TU CÓDIGO AQUÍ
    def sum_diagonal(matrix: list[list],*, primary: bool=True) -> int:
        summatory = 0
        size = len(matrix)
        if primary:
            for i in range(size):
                summatory += matrix[i][i]
        else:
            for i in range(size):
                summatory += matrix[size - 1 -i][i]
        return summatory
    
    def sum_row(matrix: list[list], rownum: int) -> int:
        size = len(matrix)
        summatory = 0
        for i in range(size):
                summatory += matrix[rownum][i]
        return summatory
    
    def sum_col(matrix: list[list], colnum: int) -> int:
        size = len(matrix)
        summatory = 0
        for i in range(size):
            summatory += matrix[i][colnum]
        return summatory
    
    checked_value = sum_diagonal(matrix)
    if checked_value != sum_diagonal(matrix, primary=False):
        return False
    for i in range(len(matrix)):
        if sum_col(matrix, i) == checked_value == sum_row(matrix, i):
            continue
        else:
            return False
    return True 
