# Práctica - Consultas de Nivel Avanzado

## Base de datos: `gestionbiblioteca`

Escribir las consultas SQL que resuelvan cada uno de los siguientes enunciados.

---

### Ejercicio 21
Mostrar el **nombre del autor** y la **cantidad de libros** que tiene registrados en la base de datos. Utilizar `JOIN` y `GROUP BY`.

---

### Ejercicio 22
Listar el **título del libro**, el **nombre del autor** y el **género**, solo para los libros publicados **después de 1965**. Utilizar `JOIN`.

---

### Ejercicio 23
Mostrar el **nombre del usuario**, el **título del libro** y la **fecha de préstamo** de todos los préstamos registrados. Utilizar `JOIN` entre las tres tablas involucradas.

---

### Ejercicio 24
Obtener el **nombre de los usuarios** que tienen **al menos un préstamo pendiente** (no devuelto). No repetir nombres. Utilizar `JOIN` y `DISTINCT`.

---

### Ejercicio 25
Listar los **autores que tienen más de un libro** registrado en la base de datos. Mostrar el nombre del autor y la cantidad de libros. Utilizar `JOIN`, `GROUP BY` y `HAVING`.

---

### Ejercicio 26
Mostrar el **título del libro** y el **nombre del usuario** para los préstamos cuya **fecha límite ya venció** y el libro **aún no fue devuelto**. Utilizar `JOIN` y la función `CURDATE()`.

---

### Ejercicio 27
Obtener la **cantidad de préstamos por usuario**. Mostrar el **nombre del usuario** y la **cantidad de préstamos** que realizó, ordenado de mayor a menor cantidad.

---

### Ejercicio 28
Listar los **libros que nunca fueron prestados**. Mostrar el título del libro. Utilizar `LEFT JOIN` y filtrar por `NULL`.

---

### Ejercicio 29
Mostrar el **nombre del autor**, el **título del libro**, el **nombre del usuario** y la **fecha de préstamo** para todos los préstamos. Ordenar por fecha de préstamo descendente. Utilizar `JOIN` entre las cuatro tablas.

---

### Ejercicio 30
Obtener los **géneros** junto con la **cantidad de libros** de cada uno y el **año de publicación promedio**, pero solo mostrar aquellos géneros que tengan **al menos 2 libros**. Utilizar `GROUP BY` y `HAVING`.
