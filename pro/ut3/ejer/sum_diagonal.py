matrix = [[1, 1, 1], [1, 2, 1], [1, 3, 1]]
# for i in range(len(matrix)):
#     for j in range(len(matrix)):
#         matrix[i][j] = 0
diagonal_sum = 0
# suponemos que es cuadrada
for i in range(len(matrix)):
    diagonal_sum += matrix[i][i]
print(diagonal_sum)
# print(matrix)
# for i in range(len(matrix)):
#     print(matrix[i])
# for i in range(len(matrix)):
#     for j in range(len(matrix)):
#         print(matrix[i][j])
