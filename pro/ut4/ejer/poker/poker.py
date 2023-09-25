from __future__ import annotations


def load_card_glyphs(path: str = "cards.dat") -> dict[str, str]:
    """Retorna un diccionario donde las claves serán los palos
    y los valores serán cadenas de texto con los glifos de las
    cartas sin ningún separador"""
    deck = {}
    with open(path) as f:
        for line in f:
            key, value = line.strip().split(":")
            value = value.replace(",", "")
            deck[key] = value
    return deck


class Card:
    CLUBS = "♣"
    DIAMONDS = "◆"
    HEARTS = "❤"
    SPADES = "♠"
    #           1,   2,   3,   4,   5,   6,   7,   8,   9,   10,  11,  12,  13
    SYMBOLS = ("A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K")
    A_VALUE = 1
    K_VALUE = 13
    GLYPHS = load_card_glyphs()

    def __init__(self, value: int | str, suit: str):
        """Notas:
        - Si el suit(palo) no es válido hay que elevar una excepción de tipo
        InvalidCardError() con el mensaje: 🃏 Invalid card: {repr(suit)} is not a supported suit
        - Si el value(como entero) no es válido (es menor que 1 o mayor que 13) hay que
        elevar una excepción de tipo InvalidCardError() con el mensaje:
        🃏 Invalid card: {repr(value)} is not a supported value
        - Si el value(como string) no es válido hay que elevar una excepción de tipo
        🃏 Invalid card: {repr(value)} is not a supported symbol

        - self.suit deberá almacenar el palo de la carta '♣◆❤♠'.
        - self.value deberá almacenar el valor de la carta (1-13)"""
        if suit not in Card.GLYPHS:
            raise InvalidCardError(f"{repr(suit)} is not a supported suit")
        self.suit = suit
        if isinstance(value, str):
            if value not in Card.SYMBOLS:
                raise InvalidCardError(f"{repr(value)} is not a supported symbol")
            value = Card.SYMBOLS.index(value) + 1
        elif isinstance(value, int):
            if value < 1 or value > 13:
                raise InvalidCardError(f"{repr(value)} is not a supported value")
        self.value = value

    @property
    def cmp_value(self) -> int:
        """Devuelve el valor (numérico) de la carta para comparar con otras.
        Tener en cuenta el AS."""
        return 14 if self.is_ace() else self.value

    def __repr__(self):
        """Devuelve el glifo de la carta"""
        return Card.GLYPHS[self.suit][self.value - 1]

    def __eq__(self, other: Card | object):
        """Indica si dos cartas son iguales"""
        if isinstance(other, Card):
            return self.cmp_value == other.cmp_value
        return False

    def __lt__(self, other: Card):
        """Indica si una carta vale menos que otra"""
        if isinstance(other, Card):
            return self.cmp_value < other.cmp_value
        return False

    def __gt__(self, other: Card):
        """Indica si una carta vale más que otra"""
        if isinstance(other, Card):
            return self.cmp_value > other.cmp_value
        return False

    def __add__(self, other: Card) -> Card:
        """Suma de dos cartas:
        1. El nuevo palo será el de la carta más alta.
        2. El nuevo valor será la suma de los valores de las cartas. Si valor pasa
        de 13 se convertirá en un AS."""
        new_suit = self.suit if self.cmp_value >= other.cmp_value else other.suit
        new_value = self.cmp_value + other.cmp_value
        if new_value > 13:
            new_value = 1
        return Card(new_value, new_suit)

    def is_ace(self) -> bool:
        """Indica si una carta es un AS"""
        return self.value == Card.A_VALUE

    @classmethod
    def get_available_suits(cls) -> str:
        """Devuelve todos los palos como una cadena de texto"""
        return "".join([key for key in cls.GLYPHS.keys()])

    @classmethod
    def get_cards_by_suit(cls, suit: str):
        """Función generadora que devuelve los glifos de las cartas por su palo"""
        for card in Card.GLYPHS[suit]:
            yield card


class InvalidCardError(Exception):
    """Clase que representa un error de carta inválida.
    - El mensaje por defecto de esta excepción debe ser: 🃏 Invalid card
    - Si se añaden otros mensajes aparecerán como: 🃏 Invalid card: El mensaje que sea"""

    def __init__(self, message: str = None):
        self.message = (
            f"🃏 Invalid card: {message}" if message != None else "🃏 Invalid card"
        )
        super().__init__(self.message)
