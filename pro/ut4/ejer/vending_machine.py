products = {
    "coca-cola": {"cost": 1, "stock": 50},
    "pepsi": {"cost": 1.2, "stock": 30},
    "kit-kat": {"cost": 1.2, "stock": 25},
}


def vending(product, money):
    if product not in products:
        return (1, money)
    if not products[product]["stock"]:
        return (2, money)
    change = money - products[product]["cost"]
    if change >= 0:
        products[product]["stock"] -= 1
        return (3, change)


match vending("coca-cola", 2):
    case (1, change):
        print(f"No vendemos ese producto, tenga sus {change}€ de vuelta.")
    case (2, change):
        print(f"Producto agotado, tenga sus {change}€ de vuelta.")
    case (3, change):
        print(f"¡Buen provecho!, no olvide sus {change}€ de cambio.")
