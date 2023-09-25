# **********
# PALÍNDROMO
# **********


def is_palindrome(text: str) -> bool:
    read_forward = text.replace(' ', '').lower()
    read_backwards = read_forward[::-1]
    return read_forward == read_backwards
    

