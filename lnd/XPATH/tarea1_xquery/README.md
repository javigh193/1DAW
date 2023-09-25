# XQuery

_Actividad XML - XQuery 1._

### Ejercicio 1

Dado el siguiente documento XML realiza las siguientes consultas con XQuery:

```
<?xml version="1.0" encoding="UTF-8"?>
<bookstore>
  <book category="COOKING">
    <title lang="en">Everyday Italian</title>
    <author>Giada De Laurentiis</author>
    <year>2005</year>
    <price>30.00</price>
  </book>
  <book category="CHILDREN">
    <title lang="en">Harry Potter</title>
    <author>J K. Rowling</author>
    <year>2005</year>
    <price>29.99</price>
  </book>
  <book category="WEB">
    <title lang="en">XQuery Kick Start</title>
    <author>James McGovern</author>
    <author>Per Bothner</author>
    <author>Kurt Cagle</author>
    <author>James Linn</author>
    <author>Vaidyanathan Nagarajan</author>
    <year>2003</year>
    <price>49.99</price>
  </book>
  <book category="WEB">
    <title lang="en">Learning XML</title>
    <author>Erik T. Ray</author>
    <year>2003</year>
    <price>39.95</price>
  </book>
</bookstore> 
```
### 1.	Mostrar los títulos de los libros con la etiqueta "titulo".

    for $title in /bookstore/book/title/text()
    return $title

<img src="img/1.png">

### 2.	Mostrar los libros cuyo precio sea menor o igual a 30. Primero incluyendo la condición en la cláusula "where" y luego en la ruta del XPath.

    for $book in /bookstore/book
    where $book/price <= 30
    return $book

<img src="img/2a.png">

    for $book in /bookstore/book[price<=30]
    return $book

<img src="img/2b.png">

### 3.	Mostrar sólo el título de los libros cuyo precio sea menor o igual a 30.

    for $book in /bookstore/book[price<=30]/title
    return $book

<img src="img/3.png">

### 4.	Mostrar sólo el título sin atributos de los libros cuyo precio sea menor o igual a 30.

    for $book in /bookstore/book[price<=30]/title/text()
    return $book

<img src="img/4.png">

### 5.	Mostrar el título y el autor de los libros del año 2005, y etiquetar cada uno de ellos con "lib2005".

    for $book in /bookstore/book[year=2005]
    return <lib2005>{$book/title}{$book/author}</lib2005>

<img src="img/5.png">

### 6.	Mostrar los años de publicación, primero con "for" y luego con "let" para comprobar la diferencia entre ellos. Etiquetar la salida con "publicacion".

    for $year in /bookstore/book/year
    return <publicacion>{$year}</publicacion>

<img src="img/6a.png">

    let $year := /bookstore/book/year
    return <publicacion>{$year}</publicacion>

<img src="img/6b.png">

### 7.	Mostrar los libros ordenados primero por "category" y luego por "title" en una sola consulta.

    for $book in /bookstore/book
    order by $book/category, $book/title
    return $book

<img src="img/7.png">

### 8.	Mostrar cuántos libros hay, y etiquetarlo con "total".

    let $total := count (/bookstore/book)
    return <total>{$total}</total>

<img src="img/8.png">

### 9.	Mostrar los títulos de los libros y al final una etiqueta con el número total de libros.

    let $libros := /bookstore/book/title
    let $total := count($libros)
    return <libros>{$libros}<total>{$total}</total></libros>

<img src="img/9.png">

### 10.	Mostrar el precio mínimo y máximo de los libros.

    let $prices := /bookstore/book/price
    return <prices><min>{min($prices)}</min><max>{max($prices)}</max></prices>

<img src="img/10.png">

### 11.	Mostrar el título del libro, su precio y su precio con el IVA incluido, cada uno con su propia etiqueta. Ordénalos por precio con IVA.

    for $book in /bookstore/book
    let $titulo := $book/title/text()
    let $precio := $book/price/text()
    let $precio_iva := $precio * 1.04
    order by $precio_iva
    return <libro><titulo>{$titulo}</titulo><precio>{$precio}</precio><precio_iva>{$precio_iva}</precio_iva></libro>

<img src="img/11.png">

### 12.	Mostrar la suma total de los precios de los libros con la etiqueta "total".

    let $total := sum(/bookstore/book/price)
    return <total>{$total}</total>

<img src="img/12.png">

### 13.	Mostrar cada uno de los precios de los libros, y al final una nueva etiqueta con la suma de los precios.

    let $precios := /bookstore/book/price
    let $total := sum($precios)
    return <libros>{$precios}<total>{$total}</total></libros>

<img src="img/13.png">

### 14.	Mostrar el título y el número de autores que tiene cada título en etiquetas diferentes.

    for $book in /bookstore/book
    return <libro><titulo>{$book/title/text()}</titulo><num_autores>{count($book/author)}</num_autores></libro>

<img src="img/14.png">

### 15.	Mostrar en la misma etiqueta el título y entre paréntesis el número de autores que tiene ese título.

    for $book in /bookstore/book
    return <libro>{$book/title/text()}({count($book/author)})</libro>

<img src="img/15.png">

### 16.	Mostrar los libros escritos en años que terminen en "3".

    for $book in /bookstore/book[ends-with(year, '3')]
    return $book

<img src="img/16.png">

### 17.	Mostrar los libros cuya categoría empiece por "C".

    for $book in /bookstore/book[starts-with(@category, 'C')]
    return $book

<img src="img/17.png">

### 18.	Mostrar los libros que tengan una "X" mayúscula o minúscula en el título.

    for $book in /bookstore/book[contains(title, 'X') or contains(title, 'x')]
    return $book

<img src="img/18.png">

### 19.	Mostrar el título y el número de caracteres que tiene cada título, cada uno con su propia etiqueta.

    for $title in /bookstore/book/title/text()
    return <libro><titulo>{$title}</titulo><caracteres>{string-length($title)}</caracteres></libro>

<img src="img/19.png">

### 20.	Mostrar todos los años en los que se ha publicado un libro eliminando los repetidos. Etiquétalos con "año".

    for $year in distinct-values(/bookstore/book/year)
    return <año>{$year}</año>

<img src="img/20.png">

### 21.	Mostrar todos los autores eliminando los que se repiten y ordenados por el número de caracteres que tiene cada autor.

    for $author in distinct-values(/bookstore/book/author)
    order by string-length($author)
    return $author

<img src="img/21.png">

### 22.	Mostrar los títulos en una tabla de HTML.

    let $titles := (for $title in /bookstore/book/title/text()
    return <tr>{$title}</tr>)
    return <table>{$titles}</table>

<img src="img/22.png">
 
