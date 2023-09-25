# ***********
# ¿HAY STOCK?
# ***********


def run(stock: dict, merch: str, amount: int) -> bool:
    # no lo tenía contemplado, si no hay merch saltaba error, de esta forma considera que
    # no hay stock disponible ( de hecho así es, no existe el producto en el stock )
    merch_stock = stock.get(merch, 0)
    available = merch_stock >= amount
    return available


if __name__ == "__main__":
    run({"pen": 20, "cup": 11, "keyring": 40}, "cup", 9)
