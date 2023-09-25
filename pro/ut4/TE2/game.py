from __future__ import annotations
import cards
import roles

def get_winner(
    players: list[roles.Player],
    community_cards: list[cards.Card],
    hole_cards: list[list[cards.Card]],
) -> tuple[roles.Player | None, cards.Hand]:
    '''Crea una partida y juega una ronda'''
    game = Game(players, community_cards, hole_cards)
    return game.play_round()


class Game:
    def __init__(
        self,
        players: list[roles.Player],
        cummunity_cards: list[cards.Card],
        hole_cards: list[list[cards.Card]],
    ):
        self.players = players
        self.community_cards = cummunity_cards
        self.private_cards = hole_cards

    def play_round(self)-> tuple[roles.Player | None, cards.Hand]:
        '''Reparte cartas a los jugadores y calcula el ganador'''
        for player, private_cards in zip(self.players, self.private_cards):
            player.community_cards = self.community_cards
            player.hole_cards = private_cards
        winner = self.players[0]
        is_draw = False
        for player in self.players[1:]:
            if player.best_hand > winner.best_hand:
                is_draw = False
                winner = player
            elif player.best_hand == winner.best_hand:
                is_draw = True
        return (None, winner.best_hand) if is_draw else (winner,winner.best_hand)