# Práctica - Consultas de Nivel Medio

## Base de datos: `gestionbiblioteca`

Escribir las consultas SQL que resuelvan cada uno de los siguientes enunciados.

---

### Ejercicio 11
Mostrar el **título** y el **año de publicación** de los libros publicados **entre 1960 y 1970** (inclusive).

```sql
SELECT titulo, anio_publicacion
FROM libro
WHERE anio_publicacion BETWEEN 1960 and 1970;
```
---

### Ejercicio 12
Listar el **nombre y la nacionalidad** de los autores cuya nacionalidad sea `'Argentina'`, `'Chilena'` o `'Peruana'`.

```sql
SELECT nombre, nacionalidad
FROM autores
WHERE nacionalidad IN ('Argentina', 'Chilena', 'Peruana');
```

---

### Ejercicio 13
Obtener los **títulos** de los libros cuyo título **comience con la letra `'C'`**.

```sql
SELECT titulo
FROM libros
WHERE titulo LIKE = 'C%'; 
```
---

### Ejercicio 14
Mostrar el **id del préstamo**, la **fecha de préstamo** y la **fecha límite** de los préstamos que **no tienen fecha de devolución** registrada.

```sql
SELECT id_prestamo, fecha_prestamo, fecha_limite
FROM prestamos
WHERE fecha_devolucion IS NULL;
```
---

### Ejercicio 15
Listar el **nombre y el teléfono** de los usuarios cuyo nombre **contenga la cadena `'ar'`** (en cualquier posición).

```sql
SELECT nombre, telefono
FROM usuarios
WHERE nombre LIKE '%ar%' 

```
---

### Ejercicio 16
Contar la **cantidad total de libros** registrados en la base de datos.

```sql
SELECT COUNT(*) AS total_libros 
FROM libros;
```
---

### Ejercicio 17
Obtener el **año de publicación más antiguo** y el **más reciente** de la tabla `libros`.

---

### Ejercicio 18
Listar los **títulos y géneros** de los libros que **no sean** del género `'Realismo mágico'` ni `'Autobiografía'`, ordenados por año de publicación de forma descendente.

---

### Ejercicio 19
Mostrar el **nombre del autor** junto con su **fecha de nacimiento**, solo para aquellos nacidos **antes de 1930**, ordenados por fecha de nacimiento descendente.

---

### Ejercicio 20
Obtener los **títulos y años de publicación** de los libros publicados **antes de 1965** cuyo género sea `'Cuentos'` o `'Literatura experimental'`.
