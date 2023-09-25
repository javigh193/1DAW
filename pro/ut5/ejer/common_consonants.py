# *******************
# CONSONANTES COMUNES
# *******************


def run(text1: str, text2: str) -> str:
    # TU CÓDIGO AQUÍ
    # vowels = "AEIOUaeiou"
    # cconst = {
    #     character
    #     for character in text1
    #     if character in text2 and character not in vowels
    # }
    # cconst = list(cconst)
    # cconst.sort()
    # cconst = "".join(cconst)
    # print(cconst)
    # return cconst
    RESTRICTED_CHRS = set("AEIOUaeiou ")
    cconst = set(text1) & set(text2) - RESTRICTED_CHRS
    cconst = "".join(sorted(cconst))
    return cconst


if __name__ == "__main__":
    run("Flat is better than nested", "Readability counts")
