quad = 1
lin = -6
ind = 3
dist = 9
min_func = ind

for x in range(-dist, dist + 1):
    func = quad * x**2 + lin * x + ind
    if func < min_func:
        min_func = func
        min_value = x
print(f"x = {min_value} y f(x) = {min_func}")
