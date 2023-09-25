# *****************
# NÚMEROS PERFECTOS
# *****************

def divisors(x: int) -> list[int]:
    return [num for num in range(1, x//2 + 1) if x%num == 0]

def is_perfect(n: int) -> bool:
    # divisors = [num for num in range(1, n//2 + 1) if n%num == 0]
    #divisors = list(filter(lambda num: n % num == 0, range(1, n // 2 + 1)))
    return sum(divisors(n)) == n
