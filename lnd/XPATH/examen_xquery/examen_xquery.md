# Examen Xquery LND

## 1. Escribe una consulta en XQuery para obtener todos los títulos de las películas en inglés.

    for $pelicula in //pelicula/titulo[@idioma='en']
    return $pelicula

## 2. Encuentra la cantidad de películas en la categoría "Acción".

    let $peliculas := //pelicula[género='Acción']
    return count($peliculas)

## 3. Obtén el título y el director de la película más reciente.

    let $max_year := max(//pelicula/año)
    for $pelicula in //pelicula
    where $pelicula/año = $max_year
    return <película>{$pelicula/titulo}{$pelicula/director}</película>

## 4. Encuentra todas las películas que tengan una duración superior a 120 minutos.

    for $pelicula in //pelicula
    where $pelicula/duración > 120
    return $pelicula

## 5. Escribe una consulta para calcular el precio promedio de todas las películas.

    let $avg_price := avg(//pelicula/precio)
    return $avg_price   

## 6. Obtén el título de la película más cara.

    let $max_price := max(//pelicula/precio)
    for $pelicula in //pelicula
    where $pelicula/precio = $max_price
    return $pelicula/titulo

## 7. Encuentra todas las películas dirigidas por Christopher Nolan.

    for $pelicula in //pelicula[director='Christopher Nolan']
    return $pelicula

## 8. Obtén el título y el año de lanzamiento de las películas que fueron lanzadas después de
## 2010 y tienen un precio inferior a 15.

    for $pelicula in //pelicula
    where $pelicula/año > 2010 and $pelicula/precio < 15
    return $pelicula

### 9. Encuentra el director de la película cuyo título es "Avengers: Endgame".

    for $pelicula in //pelicula
    where $pelicula/titulo = 'Avengers: Endgame'
    return $pelicula/director

## 10. Escribe una consulta para obtener todas las películas en orden alfabético según su
## título.

    for $pelicula in //pelicula/titulo
    order by $pelicula
    return $pelicula

### 11. Encuentra todas las películas cuyo título comienza con la letra "L".

    for $pelicula in //pelicula
    where starts-with($pelicula/titulo, 'L')
    return $pelicula

## 12. Obtén el número total de películas en la librería.

    let $num_of_films := count(//pelicula)
    return $num_of_films

## 13. Encuentra la película con la duración más larga y muestra su título, duración y año de
## lanzamiento.

    let $max_duration := max(//pelicula/duración)
    for $pelicula in //pelicula
    where $pelicula/duración = $max_duration
    return  <pelicula>
                {$pelicula/titulo}
                {$pelicula/duracion}
                {$pelicula/año}
            </pelicula>

## 14. Calcula el precio total de todas las películas en la librería y muestra el resultado.

    let $total_price := sum(//pelicula/precio)
    return $total_price

## 15. Encuentra todos los géneros distintos presentes en la librería y muestra la cantidad de
## películas para cada género.

    let $generos := distinct-values(//género)
    for $genero in $generos
    let $cantidad := count(//pelicula[género=$genero])
    return  <genero>
                <nombre>{$genero}</nombre>
                <cantidad>{$cantidad}</cantidad>
            </genero>

## 16. Crea una variable que almacene el número total de películas en la librería. Luego,
## muestra el título y el precio de las películas cuyo precio es mayor que el promedio de todos los
## precios.

    let $num_of_films := count(//pelicula)
    let $avg_price := avg(//pelicula/precio)
    for $film in //pelicula
    where $film/precio > $avg_price
    return  <pelicula>
                {$film/titulo}
                {$film/pecio}
            </pelicula>

## 17. Escribe una consulta para encontrar el género con la película más corta y muestra el
## título y la duración de esa película.

    let $min_duration := min(//pelicula/duración)
    for $film in //pelicula
    where $film/duración = $min_duration
    return  <pelicula>
                {$film/género}
                {$film/titulo}
                {$film/duración}
            </pelicula>

## 18. Encuentra todas las películas cuyo título contiene la palabra "der" y muestra el título y
## el director.

    for $film in //pelicula
    where contains($film/titulo, 'der')
    return  <pelicula>
                {$film/titulo}
                {$film/director}
            </pelicula>

## 19. Escribe una consulta para obtener el título y el director de las tres películas más
## recientes en orden descendente de año de lanzamiento.

    for $film in //pelicula
    order by $film/año descending   
    return  <pelicula>
                {$film/titulo}
                {$film/director}
            </pelicula>

## 20. Encuentra todos los directores que han dirigido películas en más de un género y
## muestra el nombre de cada director junto con los géneros en los que ha trabajado.

    let $directores := distinct-values(//director)
    for $director in $directores
    let $generos := distinct-values(//pelicula[director=$director]/género)
    let $gen_split := (
    for $gen in $generos
    return <genero>{$gen}</genero>
    )
    where count($generos) > 1
    return  <director>
                <nombre>{$director}</nombre>
                <generos>{$gen_split}</generos>
            </director>


