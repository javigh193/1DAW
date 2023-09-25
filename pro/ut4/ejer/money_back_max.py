# **************************
# AQUÍ TIENE SU VUELTA (MAX)
# **************************


def run(to_give_back: float, available_currencies: dict) -> dict:
    money_back = {}
    available_currencies = sorted(
        [(k, v) for k, v in available_currencies.items()], reverse=True
    )
    for currency in available_currencies:
        currency_type, currency_amount = currency
        amount = to_give_back // currency_type
        if amount > 0:
            money_back[currency_type] = min(amount, currency_amount)
            to_give_back -= money_back[currency_type] * currency_type
        if to_give_back == 0:
            return money_back
    return None


if __name__ == "__main__":
    run(20, {5: 3, 2: 7, 1: 3})
