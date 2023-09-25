class Fraction:
    def __init__(self, num: int, den: int):
        gcdiv = self.gcd(num, den)
        self.num = num // gcdiv
        self.den = den // gcdiv

    def __str__(self) -> str:
        num_width = len(str(self.num))
        den_width = len(str(self.den))
        line_width = max(num_width, den_width)
        line_gap = int(abs(num_width - den_width) / 2)
        if num_width > den_width:
            return f" {self.num}\n-{'-' * line_width}-\n {' ' * line_gap}{self.den}"
        else:
            return f" {' ' * line_gap}{self.num}\n-{'-' * line_width}-\n {self.den}"

    def __add__(self, other):
        if isinstance(other, Fraction):
            new_num = self.num * other.den + self.den * other.num
            new_den = self.den * self.num
        elif isinstance(other, int):
            new_num = self.num + self.den * other
            new_den = self.den
        else:
            print("ERROR")
            return None
        return Fraction(new_num, new_den)

    def __sub__(self, other):
        new_num = self.num * other.den - self.den * other.num
        new_den = self.den * self.num
        return Fraction(new_num, new_den)

    def __mul__(self, other):
        new_num = self.num * other.num
        new_den = self.den * other.den
        return Fraction(new_num, new_den)

    def __truediv__(self, other):
        new_num = self.num * other.den
        new_den = self.den * other.num
        return Fraction(new_num, new_den)

    @staticmethod
    def gcd(a: int, b: int) -> int:
        while b > 0:
            a, b = b, a % b
        return a


frac1 = Fraction(25, 30)
frac2 = Fraction(40, 45)

frac3 = frac1 + frac2
print(frac3)

frac3 = frac1 - frac2
print(frac3)

frac3 = frac1 * frac2
print(frac3)

frac3 = frac1 / frac2
print(frac3)

frac3 = frac1 + 1
print(frac3)
