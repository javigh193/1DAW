str1 = "abc"
str2 = "123"
result = ""
for element1 in str1:
    for element2 in str2:
        result = result + element1 + element2 + " "
print(result)
