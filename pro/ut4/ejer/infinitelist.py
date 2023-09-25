class InfiniteList:
    def __init__(self, *items, fill_value=None):
        self.items = list(items)
        self.fill_value = fill_value

    def __setitem__(self, index: int, item):
        # fatal, revisar
        # if index < len(self):
        #     self.items[index] = item
        # else:
        for _ in range(len(self), index + 1):
            self.items.append(self.fill_value)
        self.items[index] = item

    def __getitem__(self, index: int):
        return self.items[index]

    def __len__(self):
        return len(self.items)


dogs = InfiniteList("Carlino", "Corgui", fill_value="Lorem ipsum")
for i in range(len(dogs)):
    print(dogs[i])
dogs[0] = "Shiba Inu"
print(dogs[0])
dogs[5] = "Akita"
for i in range(len(dogs)):
    print(dogs[i])
dogs[0] = "Shiba Inu"
dogs[3] = "Pastor Alemán"
for i in range(len(dogs)):
    print(dogs[i])
