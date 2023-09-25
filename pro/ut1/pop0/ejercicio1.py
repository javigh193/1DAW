# ut1-pop0-ej1
seconds = 31256
# No tocar nada de aquí hacia arriba ↑
# ********************************************************

# ========================================================
# @@ Escribe tu código debajo de esta línea ↓
seconds_input = seconds
hours = seconds // 3600
minutes = (seconds % 3600) // 60
seconds = (seconds % 3600) % 60   
print(f'{seconds_input} son: {hours} horas, {minutes} minutos y {seconds} segundos')
# $$ Escribe tu código encima de esta línea ↑
# ========================================================

# ********************************************************
# No tocar nada de aquí hacia abajo ↓
assert hours == 8
assert minutes == 40
assert seconds == 56