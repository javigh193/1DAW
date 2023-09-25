from operator import truediv


year = int(input("Type a year: "))
if year % 4 == 0 and year % 100 != 0:
    print(f'{year} is leap year')
elif year % 400 == 0:
        print(f'{year} is leap year')
else:
    print(f'{year} is not leap year')
