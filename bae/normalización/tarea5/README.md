# Pedidos

Se parte de la siguiente tabla:

orden (id_orden, fecha, id_cliente, nom_cliente, ciudad, num_art, nom_art, cant, precio)

![image](https://user-images.githubusercontent.com/115082160/204842497-c6450839-571b-401f-8579-eb46d7ac7235.png)

## 1. Comprobar si se cumple la 1ª Forma Normal

No se cumple la primera forma normal, ya que los valores no son atómicos. El campo id_orden tiene el mismo valor en diferentes tuplas. 

## 2. Normalizar si no se cumple el apartado 1

Separo la tabla en varias tablas para eliminar las repeticiones del valor de las PKs.

<img src="tarea5.1.png">

## 3. Comprobar si se cumple la 2ª Forma Normal

La segunda forma normal se cumple si los atributos de las diferentes tablas dependen funcionalmente de sus respectivas PKs.

Tras la separación en diferentes tablas se cumple la segunda forma normal.

## 4. Normalizar si no se cumple el apartado 4

Como se cumple no hay que normalizar.

## 5. Comprobar si se cumple la 3ª Forma Normal

La tercera forma normal se cumple si no hay transitivides entre atributos de una misma tabla que no sean con la PK correspondiente.

En las tablas resultantes del paso 2 se cumple esta condición. 

## 6. Normalizar si no se cumple el apartado 5

Se cumple el apartado 5.

## 7. Indicar claves de todas las tablas resultantes

Orden --> PK: IdOrden

IdCliente --> PK: IdCliente

Incluye --> PK: IdOrden + NumArt

Artículo --> PK: NumArt

## 8. Genera el diagrama E/R resultante

<img src="tarea5.2.png">
