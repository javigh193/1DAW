# ********************
# AQUÍ TIENE SU VUELTA
# ********************


def run(to_give_back: float, available_currencies: list) -> dict:
    money_back = {}
    available_currencies.sort(reverse=True)
    for currency in available_currencies:
        amount, to_give_back = divmod(to_give_back, currency)
        if amount > 0:
            money_back[currency] = amount
        if to_give_back == 0:
            return money_back
    return None


if __name__ == "__main__":
    run(20, [5, 2, 1])
