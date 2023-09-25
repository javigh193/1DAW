from __future__ import annotations
import cards
import game
import roles
import sqlite3

db_path = 'players.sqlite'
num_players = 4

CREATE_DB = '''CREATE TABLE IF NOT EXISTS player (
    id INTEGER PRIMARY KEY,
    name TEXT,
    surname TEXT,
    alias TEXT UNIQUE
);
INSERT INTO player (name, surname, alias) VALUES( 'Luis', 'García', 'Luisix');
INSERT INTO player (name, surname, alias) VALUES( 'Marta', 'López', 'PokeMarta');
INSERT INTO player (name, surname, alias) VALUES( 'Pedro', 'Rodríguez', 'Pedro71');
INSERT INTO player (name, surname, alias) VALUES( 'Andrés', 'Fernández', 'AAndres');
'''

def players_from_db(db_path: str, num_players: int) -> list[roles.Player]:
    '''Crea 'num_players' jugadores desde la base de datos, los toma por 
    orden de inserción'''
    con = sqlite3.connect(':memory:')
    cur = con.cursor()
    cur.executescript(CREATE_DB)
    players = []
    for i in range(1, num_players + 1):
        sql = 'SELECT alias FROM player WHERE id=?'
        res = cur.execute(sql, (i,))
        alias = res.fetchone()[0]
        players.append(roles.Player(alias))
    con.close()
    return players

def deal_cards(num_players: int) -> tuple[list[cards.Card], list[cards.Card]]:
    '''Reparte las cartas necesarias para jugar una ronda'''
    deck = cards.Deck()
    community_cards = [deck.deal_top_card() for _ in range(5)]
    hole_cards = [[deck.deal_top_card(), deck.deal_top_card()] for _ in range(num_players)]
    return community_cards, hole_cards

if __name__ == "__main__":
    players = players_from_db(db_path, num_players)
    community_cards, hole_cards = deal_cards(num_players)
    winner_player, winner_hand = game.get_winner(players, community_cards, hole_cards)
    for player in players:
        print(player)
    result = 'Draw' if winner_player is None else f'{winner_player.name} wins!'
    print(f'Community Cards: {community_cards}')
    print(f'{result} {winner_hand}')