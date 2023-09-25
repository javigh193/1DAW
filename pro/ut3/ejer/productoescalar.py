v1 = [4, 3, 8, 1]
v2 = [9, 2, 7, 3]
esc_prod = 0
for val1, val2 in zip(v1, v2):
    esc_prod += val1 * val2
print(esc_prod)
