DAYS_IN_MONTH = (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
DAYS_OF_WEEK = (
    "Domingo",
    "Lunes",
    "Martes",
    "Miércoles",
    "Jueves",
    "Viernes",
    "Sábado",
)
MONTHS_IN_YEAR = (
    "enero",
    "febrero",
    "marzo",
    "abril",
    "mayo",
    "junio",
    "julio",
    "agosto",
    "septiembre",
    "octubre",
    "noviembre",
    "diciembre",
)
MIN_YEAR_LIMIT = 1900
MAX_YEAR_LIMIT = 2050


class Date:
    def __init__(self, day: int, month: int, year: int):
        """Validar día, mes y año. Se comprobará si la fecha es correcta
        (entre el 1-1-1900 y el 31-12-2050); si el día no es correcto, lo pondrá a 1;
        si el mes no es correcto, lo pondrá a 1; y si el año no es correcto, lo pondrá a 1900.
        Ojo con los años bisiestos.
        """
        if year >= MIN_YEAR_LIMIT and year <= MAX_YEAR_LIMIT:
            self.year = year
        else:
            self.year = MIN_YEAR_LIMIT
        if month > 0 and month <= 12:
            self.month = month
        else:
            self.month = 1
        if day > 0 and day <= Date.days_in_month(self.month, self.year):
            self.day = day
        else:
            self.day = 1

    @staticmethod
    def is_leap_year(year: int) -> bool:
        return not (year % 4 and (year % 400 or not (year % 100)))

    @staticmethod
    def days_in_month(month: int, year: int) -> int:
        if month == 2 and Date.is_leap_year(year):
            return 29
        return DAYS_IN_MONTH[month - 1]

    def delta_days(self) -> int:
        """Número de días transcurridos desde el 1-1-1900 hasta la fecha"""
        delta = self.day - 1
        for month in range(1, self.month):
            delta += Date.days_in_month(month, self.year)
        for year in range(MIN_YEAR_LIMIT, self.year):
            delta += 366 if self.is_leap_year(year) else 365
        return delta

    def weekday(self) -> int:
        """día de la semana de la fecha (0 para domingo, ..., 6 para sábado).
        El 1-1-1900 fue domingo."""
        return self.delta_days() % 7

    def is_weekend(self) -> bool:
        return self.weekday in (0, 6)

    def short_date(self) -> str:
        """02/09/2003"""
        return (
            f"{'0' if self.day < 10 else ''}{self.day}/"
            f"{'0' if self.month < 10 else ''}{self.month}/"
            f"{self.year}"
        )

    def __str__(self):
        """martes 2 de septiembre de 2003"""
        return (
            f"{DAYS_OF_WEEK[self.weekday()]} {self.day} "
            f"de {MONTHS_IN_YEAR[self.month - 1]} de {self.year}"
        )

    def __add__(self, days_to_add: int):
        if isinstance(days_to_add, int):
            added_years, days_to_add = divmod(days_to_add, 365)
            new_year = self.year + added_years
            for year in range(self.year, new_year):
                if Date.is_leap_year(year):
                    first_leap_year = year
                    days_to_add += (new_year - first_leap_year) // 4
                    break
            if (
                days_to_add - (Date.days_in_month(self.month, new_year) - self.day)
            ) > 0:
                new_month = self.month + 1
                if new_month == 13:
                    new_year += 1
                    new_month = 1
                added_days = Date.days_in_month(self.month, new_year) - self.day
                while True:
                    added_days += Date.days_in_month(new_month, new_year)
                    if added_days < days_to_add:
                        new_month += 1
                        if new_month == 13:
                            new_month = 1
                            new_year += 1
                    else:
                        new_day = days_to_add - (
                            added_days - Date.days_in_month(new_month, new_year)
                        )
                        break
            else:
                new_month = self.month
                new_day = self.day + days_to_add
            if new_year > MAX_YEAR_LIMIT:
                print("Warning: max year limit reached")
                return Date(31, 12, MAX_YEAR_LIMIT)
            return Date(new_day, new_month, new_year)
        else:
            print("ERROR: se deben indicar los días a sumar como un entero.")
            return None

    def __sub__(self, other):
        """Si el argumento es una cantidad entera de días, calcula la fecha anterior correspondiente.
        Si el argumento es otra fecha, calcula la diferencia en días entre ambas fechas"""
        if isinstance(other, int):
            sub_years, days_to_sub = divmod(other, 365)
            new_year = self.year - sub_years
            for year in range(new_year, self.year):
                if Date.is_leap_year(year):
                    first_leap_year = year
                    days_to_sub += (self.year - first_leap_year) // 4
                    break
            if (
                days_to_sub - (Date.days_in_month(self.month, new_year) - self.day)
            ) > 0:
                new_month = self.month - 1
                if new_month == 0:
                    new_year -= 1
                    new_month = 12
                substracted_days = Date.days_in_month(self.month, new_year) - self.day
                while True:
                    substracted_days += Date.days_in_month(new_month, new_year)
                    if substracted_days < days_to_sub:
                        new_month -= 1
                        if new_month == 0:
                            new_month = 12
                            new_year -= 1
                    else:
                        new_day = days_to_sub - (
                            substracted_days - Date.days_in_month(new_month, new_year)
                        )
                        break
            else:
                new_month = self.month
                new_day = self.day - days_to_sub
            if new_year < MIN_YEAR_LIMIT:
                print("Warning: min year limit reached")
                return Date(1, 1, MIN_YEAR_LIMIT)
            return Date(new_day, new_month, new_year)
        elif isinstance(other, Date):
            return abs(self.delta_days() - other.delta_days())
        else:
            error = "Error: solo esta soportada la resta de fechas o días."
            return False, error

    def __eq__(self, other):
        if isinstance(other, Date):
            return self.delta_days() == other.delta_days
        else:
            error = "Solo está soportada la comparación entre fechas"
            return False, error

    def __gt__(self, other):
        if isinstance(other, Date):
            return self.delta_days() > other.delta_days()
        else:
            error = "Solo está soportada la comparación entre fechas"
            return False, error

    def __lt__(self, other):
        if isinstance(other, Date):
            return self.delta_days() < other.delta_days()
        else:
            error = "Solo está soportada la comparación entre fechas"
            return False, error

    # operador + suma días a la fecha
    # operador - resta días a la fecha o calcula la diferencia entre dos fechas
    # operador == dice si dos fechas son iguales
    # operador > dice si una fecha es mayor que otra
    # operador < dice si una fecha es menor que otra


date0 = Date(1, 1, 1900)
date1 = date0 + 10
date2 = date0 + (365 + 28 + 365 + 30)
print(date0.short_date(), date0.delta_days())
print(date0)
print(date1)
print(date2)
print(date0 == date1, date0 < date1, date0 > date1, date0 == "manzana")
print(date1 - date0, date2 - 60)
date4 = Date(18, 4, 2023)
print(date4)
