# ut1-pop1-ej5
text = 'El Sistema Operativo que funcionará Libre y Gratuito'
# No tocar nada de aquí hacia arriba ↑
# ********************************************************

# ========================================================
# @@ Escribe tu código debajo de esta línea ↓
text_lower = text.lower()
text_lower_nospace = text_lower.replace(' ', '-')
slug = text_lower_nospace.replace('á', 'a')
slug = slug.replace('é', 'e')
slug = slug.replace('í', 'i')
slug = slug.replace('ó', 'o')
slug = slug.replace('ú', 'u')
# $$ Escribe tu código encima de esta línea ↑
# ========================================================

# ********************************************************
# No tocar nada de aquí hacia abajo ↓
assert slug == 'el-sistema-operativo-que-funcionara-libre-y-gratuito'