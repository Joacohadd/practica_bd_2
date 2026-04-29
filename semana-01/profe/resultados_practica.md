# Resultados de la Práctica — Consultas SQL

## Base de datos: `gestionbiblioteca`

---

## Consultas Simples (Ejercicios 1 al 10)

### Ejercicio 1
Listar todos los datos de la tabla `autores`.

```sql
SELECT *
FROM autores;
```

---

### Ejercicio 2
Mostrar el título y el género de todos los libros.

```sql
SELECT titulo, genero
FROM libros;
```

---

### Ejercicio 3
Obtener el nombre y el email de todos los usuarios registrados.

```sql
SELECT nombre, email
FROM usuarios;
```

---

### Ejercicio 4
Listar los títulos de los libros que pertenecen al género 'Novela'.

```sql
SELECT titulo
FROM libros
WHERE genero = 'Novela';
```

---

### Ejercicio 5
Mostrar el nombre y la nacionalidad de los autores de nacionalidad 'Argentina'.

```sql
SELECT nombre_autor, nacionalidad
FROM autores
WHERE nacionalidad = 'Argentina';
```

---

### Ejercicio 6
Obtener los títulos de los libros publicados después del año 1967.

```sql
SELECT titulo
FROM libros
WHERE anio_publicacion > 1967;
```

---

### Ejercicio 7
Listar los préstamos que aún no fueron devueltos.

```sql
SELECT *
FROM prestamos
WHERE devuelto = 0;
```

---

### Ejercicio 8
Mostrar los títulos de todos los libros ordenados alfabéticamente.

```sql
SELECT titulo
FROM libros
ORDER BY titulo ASC;
```

---

### Ejercicio 9
Obtener los 3 primeros autores ordenados por fecha de nacimiento ascendente.

```sql
SELECT *
FROM autores
ORDER BY fecha_nacimiento ASC
LIMIT 3;
```

---

### Ejercicio 10
Listar todos los géneros distintos que existen en la tabla libros.

```sql
SELECT DISTINCT genero
FROM libros;
```

---

## Consultas de Nivel Medio (Ejercicios 11 al 20)

### Ejercicio 11
Mostrar el título y el año de publicación de los libros publicados entre 1960 y 1970.

```sql
SELECT titulo, anio_publicacion
FROM libros
WHERE anio_publicacion BETWEEN 1960 AND 1970;
```

---

### Ejercicio 12
Listar el nombre y la nacionalidad de los autores cuya nacionalidad sea 'Argentina', 'Chilena' o 'Peruana'.

```sql
SELECT nombre_autor, nacionalidad
FROM autores
WHERE nacionalidad IN ('Argentina', 'Chilena', 'Peruana');
```

---

### Ejercicio 13
Obtener los títulos de los libros cuyo título comience con la letra 'C'.

```sql
SELECT titulo
FROM libros
WHERE titulo LIKE 'C%';
```

---

### Ejercicio 14
Mostrar el id del préstamo, la fecha de préstamo y la fecha límite de los préstamos que no tienen fecha de devolución registrada.

```sql
SELECT id_prestamo, fecha_prestamo, fecha_limite
FROM prestamos
WHERE fecha_devolucion IS NULL;
```

---

### Ejercicio 15
Listar el nombre y el teléfono de los usuarios cuyo nombre contenga la cadena 'ar'.

```sql
SELECT nombre, telefono
FROM usuarios
WHERE nombre LIKE '%ar%';
```

---

### Ejercicio 16
Contar la cantidad total de libros registrados en la base de datos.

```sql
SELECT COUNT(*) AS total_libros
FROM libros;
```

---

### Ejercicio 17
Obtener el año de publicación más antiguo y el más reciente de la tabla libros.

```sql
SELECT
    MIN(anio_publicacion) AS mas_antiguo,
    MAX(anio_publicacion) AS mas_reciente
FROM libros;
```

---

### Ejercicio 18
Listar los títulos y géneros de los libros que no sean del género 'Realismo mágico' ni 'Autobiografía', ordenados por año de publicación descendente.

```sql
SELECT titulo, genero
FROM libros
WHERE genero NOT IN ('Realismo mágico', 'Autobiografía')
ORDER BY anio_publicacion DESC;
```

---

### Ejercicio 19
Mostrar el nombre del autor junto con su fecha de nacimiento, solo para aquellos nacidos antes de 1930, ordenados por fecha de nacimiento descendente.

```sql
SELECT nombre_autor, fecha_nacimiento
FROM autores
WHERE fecha_nacimiento < '1930-01-01'
ORDER BY fecha_nacimiento DESC;
```

---

### Ejercicio 20
Obtener los títulos y años de publicación de los libros publicados antes de 1965 cuyo género sea 'Cuentos' o 'Literatura experimental'.

```sql
SELECT titulo, anio_publicacion
FROM libros
WHERE anio_publicacion < 1965
  AND genero IN ('Cuentos', 'Literatura experimental');
```

---

## Consultas de Nivel Avanzado (Ejercicios 21 al 30)

### Ejercicio 21
Mostrar el nombre del autor y la cantidad de libros que tiene registrados.

```sql
SELECT a.nombre_autor, COUNT(l.id_libro) AS cantidad_libros
FROM autores a
JOIN libros l ON a.id_autor = l.id_autor
GROUP BY a.id_autor, a.nombre_autor;
```

---

### Ejercicio 22
Listar el título del libro, el nombre del autor y el género, solo para los libros publicados después de 1965.

```sql
SELECT l.titulo, a.nombre_autor, l.genero
FROM libros l
JOIN autores a ON l.id_autor = a.id_autor
WHERE l.anio_publicacion > 1965;
```

---

### Ejercicio 23
Mostrar el nombre del usuario, el título del libro y la fecha de préstamo de todos los préstamos.

```sql
SELECT u.nombre, l.titulo, p.fecha_prestamo
FROM prestamos p
JOIN usuarios u ON p.id_usuario = u.id_usuario
JOIN libros l ON p.id_libro = l.id_libro;
```

---

### Ejercicio 24
Obtener el nombre de los usuarios que tienen al menos un préstamo pendiente (no devuelto), sin repetir nombres.

```sql
SELECT DISTINCT u.nombre
FROM usuarios u
JOIN prestamos p ON u.id_usuario = p.id_usuario
WHERE p.devuelto = 0;
```

---

### Ejercicio 25
Listar los autores que tienen más de un libro registrado. Mostrar nombre y cantidad.

```sql
SELECT a.nombre_autor, COUNT(l.id_libro) AS cantidad_libros
FROM autores a
JOIN libros l ON a.id_autor = l.id_autor
GROUP BY a.id_autor, a.nombre_autor
HAVING COUNT(l.id_libro) > 1;
```

---

### Ejercicio 26
Mostrar el título del libro y el nombre del usuario para préstamos vencidos y no devueltos.

```sql
SELECT l.titulo, u.nombre
FROM prestamos p
JOIN libros l ON p.id_libro = l.id_libro
JOIN usuarios u ON p.id_usuario = u.id_usuario
WHERE p.fecha_limite < CURDATE()
  AND p.devuelto = 0;
```

---

### Ejercicio 27
Obtener la cantidad de préstamos por usuario, ordenado de mayor a menor cantidad.

```sql
SELECT u.nombre, COUNT(p.id_prestamo) AS cantidad_prestamos
FROM usuarios u
JOIN prestamos p ON u.id_usuario = p.id_usuario
GROUP BY u.id_usuario, u.nombre
ORDER BY cantidad_prestamos DESC;
```

---

### Ejercicio 28
Listar los libros que nunca fueron prestados.

```sql
SELECT l.titulo
FROM libros l
LEFT JOIN prestamos p ON l.id_libro = p.id_libro
WHERE p.id_prestamo IS NULL;
```

---

### Ejercicio 29
Mostrar el nombre del autor, título del libro, nombre del usuario y fecha de préstamo para todos los préstamos, ordenado por fecha descendente.

```sql
SELECT a.nombre_autor, l.titulo, u.nombre, p.fecha_prestamo
FROM prestamos p
JOIN libros l ON p.id_libro = l.id_libro
JOIN autores a ON l.id_autor = a.id_autor
JOIN usuarios u ON p.id_usuario = u.id_usuario
ORDER BY p.fecha_prestamo DESC;
```

---

### Ejercicio 30
Obtener los géneros con cantidad de libros y año de publicación promedio, solo para géneros con al menos 2 libros.

```sql
SELECT
    genero,
    COUNT(*) AS cantidad_libros,
    ROUND(AVG(anio_publicacion)) AS anio_promedio
FROM libros
GROUP BY genero
HAVING COUNT(*) >= 2;
```
