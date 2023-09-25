max_exp = 5
base = 2
powers_n = []
# for exp in range(max_exp + 1):
#     powers_2.append(base**exp)
# print(powers_2)
powers_n = [base**exp for exp in range(max_exp + 1)]
print(powers_n)
