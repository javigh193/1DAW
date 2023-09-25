# *****************
# ALFABETO CIRCULAR
# *****************

#VERSION ORIGINAL
# def cycle_chars(first_chr: str, last_chr: str, max_chars: int):
#     first_code = ord(first_chr)
#     last_code = ord(last_chr)
#     codes = range(first_code, last_code + 1)
#     codes_len = len(codes)
#     chars = []
#     while codes_len < max_chars:
#         # chars.extend(list(map(lambda code: chr(code), codes)))
#         chars.extend([chr(code) for code in codes])
#         max_chars -= codes_len
#     chars.extend(
#         [char for char, _ in zip([chr(code) for code in codes], range(max_chars))]
#     )
#     # chars.extend(
#     #     [
#     #         # char for char, _ in zip((map(lambda code: chr(code), codes)), range(max_chars))
#     #     ]
#     # )
#     for char in chars:
#         yield char

# def run(max_letters: int) -> str:
#     letters = []
#     for letter in cycle_chars("a", "z", max_letters):
#         letters.append(letter)
#     text = "".join(letters)
#     return text

# if __name__ == "__main__":
#     run(0)

#VERSION TRAS EXPLICACION DE DESPLAZAMIENTO MODULAR
#función generadora auxiliar
british_alphabet={'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l','m', 
                  'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'}

def cycle_chars(num_letters: int, alphabet: str) -> str:
    for i in range(num_letters):
        alphabet_i = i % len(alphabet)
        yield alphabet[alphabet_i]

def run(max_letters: int) -> str:
    alphabet = "".join(sorted(british_alphabet))
    text = "".join(cycle_chars(max_letters, alphabet))
    return text

if __name__ == "__main__":
    run(0)