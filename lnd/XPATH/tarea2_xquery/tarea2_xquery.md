# XQuery

_Actividad XML - XQuery 2._

### Ejercicio 2

Dado el siguiente documento XML realiza las siguientes consultas con XQuery:

```
<?xml version="1.0" encoding="UTF-8"?>
<videojuego>
  <titulo>Valorant</titulo>
  <genero>Juego de disparos en primera persona</genero>
  <plataforma>PC</plataforma>
  <desarrollador>Riot Games</desarrollador>
  <fechaLanzamiento>2 de junio de 2020</fechaLanzamiento>
  <agentes>
    <agente>
      <nombre>Jett</nombre>
      <habilidadPrimaria tipo="Daño" duracion="4">Cuchillo Arrojadizo</habilidadPrimaria>
      <habilidadSecundaria tipo="Curación" duracion="0">Vientos Ligeros</habilidadSecundaria>
      <habilidadUltimate tipo="Daño" duracion="6">Tormenta de Cuchillos</habilidadUltimate>
    </agente>
    <agente>
      <nombre>Brimstone</nombre>
      <habilidadPrimaria tipo="Daño" duracion="6">Granada Incendiaria</habilidadPrimaria>
      <habilidadSecundaria tipo="Curación" duracion="0">Estímulo de Combate</habilidadSecundaria>
      <habilidadUltimate tipo="Daño" duracion="4">Incendiario Orbital</habilidadUltimate>
    </agente>
    <agente>
      <nombre>Viper</nombre>
      <habilidadPrimaria tipo="Daño" duracion="8">Nube Venenosa</habilidadPrimaria>
      <habilidadSecundaria tipo="Daño" duracion="6">Pantalla Tóxica</habilidadSecundaria>
      <habilidadUltimate tipo="Curación" duracion="12">Recolección Táctica</habilidadUltimate>
    </agente>
    <agente>
      <nombre>Phoenix</nombre>
      <habilidadPrimaria tipo="Daño" duracion="4">Bola Curva de Fuego</habilidadPrimaria>
      <habilidadSecundaria tipo="Curación" duracion="0">Escudo Curativo</habilidadSecundaria>
      <habilidadUltimate tipo="Daño" duracion="6">Explosión Cósmica</habilidadUltimate>
    </agente>
    <agente>
      <nombre>Sage</nombre>
      <habilidadPrimaria tipo="Curación" duracion="0">Orbe de Curación</habilidadPrimaria>
      <habilidadSecundaria tipo="Daño" duracion="4">Muro de Hielo</habilidadSecundaria>
      <habilidadUltimate tipo="Curación" duracion="5">Resurrección</habilidadUltimate>
    </agente>
    <agente>
      <nombre>Cypher</nombre>
      <habilidadPrimaria tipo="Daño" duracion="4">Trampa Cibernética</habilidadPrimaria>
      <habilidadSecundaria tipo="Daño" duracion="7">Cámara Espía</habilidadSecundaria>
      <habilidadUltimate tipo="Curación" duracion="0">Ataque de Neurona</habilidadUltimate>
    </agente>
  </agentes>
</videojuego>
```
### 1. Muestra el título del videojuego.

<img src="img/1.png">

### 2. Muestra la plataforma del videojuego.

<img src="img/2.png">

### 3. Muestra el nombre de todos los agentes.

<img src="img/3.png">

### 4. Muestra el nombre y la habilidad ultimate de todos los agentes.

<img src="img/4.png">

### 5. Muestra los nombres de los agentes cuya habilidad primaria es "Incendiario".

<img src="img/5.png">

### 6. Muestra los nombres de los agentes cuya habilidad ultimate es "Fénix".

<img src="img/6.png">

### 7.	Muestra las habilidades primarias de los agentes cuyo nombre empieza por "J".

<img src="img/7.png">

### 8.	Muestra los nombres de los agentes cuyas habilidades primarias empiezan por "Bola".

<img src="img/8.png">

### 9. Muestra los nombres de todos los agentes en orden alfabético.

<img src="img/9.png">

### 10. Muestra las habilidades primarias y secundarias de los agentes cuyo nombre contiene la letra "y".

<img src="img/10.png">

### 11. Muestra los nombres de los agentes cuya habilidad ultimate contiene la palabra "cuchillos".

<img src="img/11.png">

### 12. Muestra las habilidades primarias de los agentes cuyo nombre contiene la letra "o" y la habilidad secundaria contiene la palabra "humo".

<img src="img/12.png">

### 13. Muestra los nombres de los agentes que tienen exactamente tres habilidades.

<img src="img/13.png">

### 14. Muestra los nombres de los agentes cuya habilidad secundaria no es "Granada Cegadora".

<img src="img/14.png">

### 15. Muestra las habilidades primarias de los agentes cuyos nombres no contienen la letra "e".

<img src="img/15.png">

### 16. Muestra los nombres de los agentes cuyas habilidades primarias contienen la palabra "muro" o la palabra "barrera".

<img src="img/16.png">

### 17. Muestra las habilidades ultimates de los agentes en orden alfabético inverso.

<img src="img/17.png">

### 18. Muestra los nombres de los agentes cuya habilidad ultimate tiene una duración mayor a 8 segundos.

<img src="img/18.png">

### 19. Muestra el nombre del agente con la habilidad ultimate más corta.

<img src="img/19.png">

### 20. Muestra los nombres de los agentes que tienen habilidades primarias y secundarias con la misma duración.

<img src="img/20.png">

### 21. Muestra el nombre de los agentes que tienen habilidades primarias y secundarias que pertenecen al mismo tipo.

<img src="img/21.png">

### 22. Muestra los nombres de los agentes cuyas habilidades primarias son de tipo "Daño" y sus habilidades secundarias son de tipo "Curación".

<img src="img/22.png">
