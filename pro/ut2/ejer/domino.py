row = ""
for left in range(6 + 1):
    for right in range(6 - left, 0 - 1, -1):
        row += f"{left} | {6 - right}  "
    print(row)
    row = ""
