string1 = "123bahknkb2"
string2 = "1gh67896agg"
d_hamming = 0
for char in range(len(string1)):
    if string1[char] != string2[char]:
        d_hamming += 1
print(d_hamming)
