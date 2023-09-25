from __future__ import annotations

import sqlite3

DB_PATH = "todo.db"
TASK_DONE_SYMBOL = "✔"
TASK_PENDING_SYMBOL = "⎕"


class Task:
    """Crear atributos de clase:
    - con: para la conexión a la base de datos. Establecer consultas como diccionarios.
    - cur: para el cursor de manejo."""

    con = sqlite3.connect(DB_PATH)
    con.row_factory = sqlite3.Row
    cur = con.cursor()

    def __init__(self, name: str, done: bool = False, id: int = -1):
        """Crea los atributos homónimos a los parámetros"""
        self.name = name
        self.done = done
        self.id = id

    def save(self):
        """Guarda esta tarea en la base de datos.
        El identificador asignado en la base de datos se debe usar para actualizar el
        atributo id de la tarea."""
        sql = "INSERT INTO tasks (name, done) VALUES (?, ?)"
        self.cur.execute(sql, (self.name, self.done))
        self.con.commit()
        self.id = self.cur.lastrowid

    def update(self):
        """Actualiza la tarea (nombre y estado) en la base de datos"""
        sql = "UPDATE tasks SET name=?, done=?"
        self.cur.execute(sql, (self.name, self.done))
        self.con.commit()

    def check(self):
        """Marca la tarea como completada. Haz uso también de .update()"""
        self.done = True
        self.update()

    def uncheck(self):
        """Marca la tarea como no completada. Haz uso también de .update()"""
        self.done = False
        self.update()

    def __repr__(self):
        """Muestra la tarea en formato:
        <SYMBOL> <name> (id=<id>)"""
        symbol = TASK_DONE_SYMBOL if self.done else TASK_PENDING_SYMBOL
        return f"{symbol} {self.name} (id={self.id})"

    @classmethod
    def from_db_row(cls, row: sqlite3.Row) -> Task:
        """Construye una nueva tarea a partir de una fila de consulta devuelta por execute()"""
        return Task(row["name"], row["done"], row["id"])

    @classmethod
    def get(cls, task_id: int) -> Task:
        """Devuelve un objeto Task desde la consulta a la base de datos"""
        sql = "SELECT * FROM tasks WHERE id=?"
        row = Task.cur.execute(sql, (task_id,)).fetchone()
        return Task.from_db_row(row)


class ToDo:
    """Crear atributos de clase:
    - con: para la conexión a la base de datos. Establecer consultas como diccionarios.
    - cur: para el cursor de manejo."""

    con = sqlite3.connect(DB_PATH)
    con.row_factory = sqlite3.Row
    cur = con.cursor()

    def create_db(self):
        '''Crea la tala con los campos "id", "name" y "done"'''
        sql = """CREATE TABLE tasks (
            id INTEGER,
            name TEXT,
            done INTEGER
        )"""
        ToDo.cur.execute(sql)

    def get_tasks(self, *, done: int = -1):
        """Devuelve todas las tareas como objetos de tipo Task consultando la BBDD.
        - Si done = 0 se devuelven las tareas pendientes.
        - Si done = 1 se devuelven las tareas completadas.
        - Si done = -1 se devuelven todas las teareas.
        Ojo! Esto es una función generadora."""
        sql = "SELECT * FROM tasks WHERE done=?"
        query_res = ToDo.cur.execute(sql, (done,))
        for row in query_res:
            yield Task.from_db_row(row)

    def add_task(self, name: str):
        '''Añade la tarea con nombre "name"'''
        sql = "INSERT INTO tasks (name, done) VALUES (?, ?)"
        new_task = Task(name)
        ToDo.cur.execute(sql, (new_task.name, new_task.done))
        ToDo.con.commit()
        return new_task

    def complete_task(self, task_id: int):
        """Marca la tarea con identificador "task_id" como completada"""
        sql = "UPDATE tasks SET done=1 WHERE id=?"
        ToDo.cur.execute(sql, (task_id,))
        ToDo.con.commit()

    def reopen_task(self, task_id: int):
        """Marca la tarea con identificador "task_id" como pendiente"""
        sql = "UPDATE tasks SET done=0 WHERE id=?"
        ToDo.cur.execute(sql, (task_id,))
        ToDo.con.commit()
