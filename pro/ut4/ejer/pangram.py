# ********
# PANGRAMA
# ********

# spanish_chars = {'spanish_alphabet': 
#                     {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l','m', 'n', 
#                      'ñ', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'},
#                  'spanish_special_chars': 
#                     {'á', 'é', 'í', 'ó', 'ú', 'ü'}
#                 }

british_alphabet={'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l','m', 
                  'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'}

def is_pangram(text: str) -> bool:
    letters_in_text = set([char for char in text.lower() if char.isalpha()])
    return letters_in_text == british_alphabet

# def is_pangram(text: str, alphabet: set) -> bool:
#     letters_in_text = set([char for char in text.lower() if char.isalpha()])
#     return letters_in_text == alphabet