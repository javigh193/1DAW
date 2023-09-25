import sys

values = sys.argv[1:]
values = [int(value) for value in values]
print(values)
avg = sum(values) / len(values)
print(avg)
