# ******************
# FIBONACCI ITERABLE
# ******************


class Fibonacci:
    def __init__(self, iteration_limit: int):
        self.counter = 0
        self.iteration_limit = iteration_limit
        self.preceding_term_1 = 0
        self.preceding_term_2 = 0

    def __iter__(self):
        return self

    def __next__(self):
        if self.counter >= self.iteration_limit:
            raise StopIteration
        current_term = (self.preceding_term_1 + self.preceding_term_2) or self.counter
        self.preceding_term_2 = self.preceding_term_1
        self.preceding_term_1 = current_term
        self.counter += 1
        return current_term


def run(n):
    # TU CÓDIGO AQUÍ
    return list(Fibonacci(n))
