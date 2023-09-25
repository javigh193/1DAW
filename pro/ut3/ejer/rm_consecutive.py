# values = [1, 1, 2, 3, 3, 3, 1]
# new_values = []
# for i, value in enumerate(values):
#     if i == 0:
#         new_values.append(value)
#     elif value != values[i - 1]:
#         new_values.append(value)
# print(new_values)
# no es necesario enumerate, con range lo tenemos
values = [1, 1, 2, 3, 3, 3, 1]
new_values = [values[0]]
for i in range(1, len(values)):
    if values[i] != values[i - 1]:
        new_values.append(values[i])
print(new_values)
