# Práctica - Consultas Simples

## Base de datos: `gestionbiblioteca`

Escribir las consultas SQL que resuelvan cada uno de los siguientes enunciados.

---

### Ejercicio 1
Listar **todos los datos** de la tabla `autores`.
```sql
SELECT *
FROM autores;
```
---

### Ejercicio 2
Mostrar el **título** y el **género** de todos los libros.

```sql
SELECT titulo, genero
FROM libros;
```

---

### Ejercicio 3
Obtener el **nombre** y el **email** de todos los usuarios registrados.

```sql
SELECT nombre, email
FROM usuarios;
```
---

### Ejercicio 4
Listar los **títulos** de los libros que pertenecen al género `'Novela'`.

```sql
SELECT titulo
FROM libros
WHERE genero = 'Novela';
```
---

### Ejercicio 5
Mostrar el **nombre y la nacionalidad** de los autores que sean de nacionalidad `'Argentina'`.

```sql
SELECT nombre_autor, nacionalidad
FROM autores
WHERE nacionalidad = 'Argentina';

```
---

### Ejercicio 6
Obtener los **títulos** de los libros publicados **después del año 1967**.

```sql
SELECT titulo
FROM libros
WHERE anio_publicacion > 1967;
```
---

### Ejercicio 7
Listar los **préstamos** (todos los campos) que **aún no fueron devueltos** (`devuelto = 0`).

```sql
SELECT *
FROM prestamos
WHERE devuelto = 0;
```
---

### Ejercicio 8
Mostrar los **títulos** de todos los libros ordenados **alfabéticamente** de la A a la Z.

```sql
SELECT titulo
FROM libro
ORDER BY titulo asc;

```
---

### Ejercicio 9
Obtener los **3 primeros autores** ordenados por **fecha de nacimiento** de forma ascendente (los más antiguos primero).

```sql
SELECT *
FROM autores
ORDER BY fecha_nacimiento asc
LIMIT 3;

```
---

### Ejercicio 10
Listar todos los **géneros distintos** (sin repetir) que existen en la tabla `libros`.

```sql
SELECT DISTINCT genero
FROM libro
```
