# values = [10, [50, 60, 70]]
# flattened_values = []
# for value in values:
#     if type(value) is list:
#         flattened_values.extend(value)
#     else:
#         flattened_values.append(value)
# print(flattened_values)
initial_values = [10, [50, [49, 67, 43], 70]]
flattened_values = []
# supongo que es flat hasta que se demuestre lo contrario
flat = True
for value in initial_values:
    if type(value) is list:
        flat = False
        values = initial_values
while not flat:
    for value in values:
        if type(value) is list:
            flattened_values.extend(value)
        else:
            flattened_values.append(value)
    # supongo que es flat hasta que se demuestre lo contrario
    flat = True
    for value in flattened_values:
        if type(value) is list:
            flat = False
            values = flattened_values
            flattened_values = []
print(flattened_values)
