class DNA:
    ADENINE = "A"
    THYMINE = "T"
    CYTOSINE = "C"
    GUANINE = "G"

    @classmethod
    def build_from_file(cls, path: str):
        with open(path) as f:
            new_dna = DNA(f.readline())
        return new_dna

    def __init__(self, dna_sequence: str):
        self.sequence = dna_sequence

    @property
    def adenines(self) -> int:
        return self.sequence.count(DNA.ADENINE)

    @property
    def thymines(self) -> int:
        return self.sequence.count(DNA.THYMINE)

    @property
    def cytosines(self) -> int:
        return self.sequence.count(DNA.CYTOSINE)

    @property
    def guanines(self) -> int:
        return self.sequence.count(DNA.GUANINE)

    def __len__(self):
        return len(self.sequence)

    def __str__(self):
        return self.sequence

    def __mul__(self, other):
        new_dna_sequence = ""
        for base_1, base_2 in zip(self.sequence, other.sequence):
            if base_1 == base_2:
                new_dna_sequence += base_1
        return DNA(new_dna_sequence)

    def __add__(self, other):
        length_diff = len(self) - len(other)
        if length_diff > 0:
            other.sequence += DNA.ADENINE * length_diff
        elif length_diff < 0:
            self.sequence += DNA.ADENINE * abs(length_diff)
        new_dna_sequence = ""
        for base_1, base_2 in zip(self.sequence, other.sequence):
            new_dna_sequence += max(base_1, base_2)
        return DNA(new_dna_sequence)

    def __getitem__(self, index: int):
        return self.sequence[index]

    def __setitem__(self, index: int, new_base: str):
        if new_base not in (DNA.ADENINE, DNA.THYMINE, DNA.CYTOSINE, DNA.GUANINE):
            new_base = DNA.ADENINE
        self.sequence = self.sequence[:index] + new_base + self.sequence[index + 1 :]

    def stats(self) -> dict:
        adenine_percent = (self.adenines / len(self)) * 100
        thymine_percent = (self.thymines / len(self)) * 100
        cytosine_percent = (self.cytosines / len(self)) * 100
        guanine_percent = (self.guanines / len(self)) * 100
        base_percentages = {
            DNA.ADENINE: adenine_percent,
            DNA.THYMINE: thymine_percent,
            DNA.CYTOSINE: cytosine_percent,
            DNA.GUANINE: guanine_percent,
        }
        return base_percentages

    def dump_to_file(self, path: str):
        with open(path, "w") as f:
            f.write(self.sequence)


# my_dna = DNA("ATTTCGACGGTAA")
# print(my_dna)
# my_other_dna = DNA("GGTTAC")
# new_dna = my_dna + my_other_dna
# print(new_dna)
# print(new_dna.base_percents())
# print(my_dna * my_other_dna)
# my_dna[0] = "P"
# print(my_dna[0])
# print(my_dna)
