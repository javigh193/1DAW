# *******************
# HEXADECIMAL A TEXTO
# *******************


def run(hex_codes: list) -> str:
    text = [chr(int(hex_code, base=16)) for hex_code in hex_codes]
    text = "".join(text)
    return text


if __name__ == "__main__":
    run(["1f49a", "2728", "1f389", "1f3c6"])
