num1 = 24
num2 = 45
_min = num1 if num1 < num2 else num2
for mcd in range(_min, 0, -1):
    if num1 % mcd == 0 and num2 % mcd == 0:
        break
print(mcd)
