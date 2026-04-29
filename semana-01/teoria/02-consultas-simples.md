# Consultas Simples en MySQL

## Base de datos: `gestionbiblioteca`

En esta guía trabajaremos con una base de datos de gestión de biblioteca compuesta por 4 tablas:

- **autores** (`id_autor`, `nombre_autor`, `nacionalidad`, `fecha_nacimiento`)
- **libros** (`id_libro`, `titulo`, `id_autor`, `genero`, `anio_publicacion`, `isbn`, `disponible`, `fecha_ingreso`)
- **usuarios** (`id_usuario`, `nombre`, `email`, `telefono`, `fecha_registro`)
- **prestamos** (`id_prestamo`, `id_usuario`, `id_libro`, `fecha_prestamo`, `fecha_devolucion`, `fecha_limite`, `devuelto`, `observaciones`)

---

## 1. SELECT básico — Seleccionar todas las columnas

La instrucción `SELECT *` recupera **todas las columnas** de una tabla. El asterisco (`*`) actúa como comodín que representa a todas las columnas.

```sql
SELECT *
FROM autores;
```

> **Nota:** En entornos de producción se recomienda evitar `SELECT *` y listar explícitamente las columnas necesarias, ya que mejora la legibilidad y el rendimiento.

---

## 2. Seleccionar columnas específicas

Podemos indicar exactamente qué columnas queremos obtener, separándolas por comas.

```sql
SELECT nombre_autor, nacionalidad
FROM autores;
```

Esto devuelve únicamente el nombre y la nacionalidad de cada autor, ignorando las demás columnas.

---

## 3. Alias de columnas con AS

Los **alias** permiten renombrar temporalmente una columna en el resultado. Son útiles para mejorar la legibilidad.

```sql
SELECT nombre_autor AS autor, nacionalidad AS pais
FROM autores;
```

El resultado mostrará las columnas con los encabezados `autor` y `pais` en lugar de los nombres originales.

---

## 4. WHERE — Filtrar por condición de igualdad

La cláusula `WHERE` filtra las filas que cumplen una condición determinada.

```sql
SELECT nombre_autor, nacionalidad
FROM autores
WHERE nacionalidad = 'Argentina';
```

Devuelve solo los autores cuya nacionalidad sea exactamente `'Argentina'`.

---

## 5. WHERE con operador de comparación (mayor que)

Podemos usar operadores como `>`, `<`, `>=`, `<=`, `!=` (o `<>`) para comparar valores numéricos o fechas.

```sql
SELECT titulo, anio_publicacion
FROM libros
WHERE anio_publicacion > 1965;
```

Muestra los libros publicados después de 1965.

---

## 6. WHERE con operador menor que

```sql
SELECT nombre_autor, fecha_nacimiento
FROM autores
WHERE fecha_nacimiento < '1930-01-01';
```

Devuelve los autores nacidos antes del 1 de enero de 1930 (García Márquez y Borges).

---

## 7. WHERE con operador distinto (`!=` o `<>`)

```sql
SELECT titulo, genero
FROM libros
WHERE genero != 'Novela';
```

Recupera todos los libros cuyo género **no** sea `'Novela'`.

---

## 8. AND — Múltiples condiciones que deben cumplirse simultáneamente

El operador `AND` exige que **todas** las condiciones sean verdaderas.

```sql
SELECT titulo, genero, anio_publicacion
FROM libros
WHERE genero = 'Realismo mágico'
  AND anio_publicacion > 1970;
```

Devuelve libros de realismo mágico publicados después de 1970.

---

## 9. OR — Al menos una condición debe cumplirse

El operador `OR` devuelve filas donde **al menos una** de las condiciones sea verdadera.

```sql
SELECT nombre_autor, nacionalidad
FROM autores
WHERE nacionalidad = 'Argentina'
   OR nacionalidad = 'Chilena';
```

Muestra los autores argentinos **o** chilenos.

---

## 10. Combinando AND y OR con paréntesis

Cuando combinamos `AND` y `OR`, los paréntesis definen la **precedencia** de evaluación.

```sql
SELECT titulo, genero, anio_publicacion
FROM libros
WHERE (genero = 'Novela' OR genero = 'Cuentos')
  AND anio_publicacion < 1965;
```

Sin los paréntesis, `AND` se evaluaría primero y el resultado sería diferente.

---

## 11. IN — Pertenencia a un conjunto de valores

`IN` simplifica múltiples comparaciones con `OR` sobre la misma columna.

```sql
SELECT nombre_autor, nacionalidad
FROM autores
WHERE nacionalidad IN ('Argentina', 'Colombiana', 'Peruana');
```

Equivale a: `nacionalidad = 'Argentina' OR nacionalidad = 'Colombiana' OR nacionalidad = 'Peruana'`.

---

## 12. NOT IN — Exclusión de un conjunto

```sql
SELECT titulo, genero
FROM libros
WHERE genero NOT IN ('Novela', 'Autobiografía');
```

Devuelve libros cuyo género **no** esté en la lista indicada.

---

## 13. BETWEEN — Rango de valores

`BETWEEN` selecciona valores dentro de un rango **inclusivo** (incluye ambos extremos).

```sql
SELECT titulo, anio_publicacion
FROM libros
WHERE anio_publicacion BETWEEN 1960 AND 1970;
```

Devuelve libros publicados entre 1960 y 1970 inclusive.

---

## 14. BETWEEN con fechas

```sql
SELECT nombre_autor, fecha_nacimiento
FROM autores
WHERE fecha_nacimiento BETWEEN '1900-01-01' AND '1940-12-31';
```

Muestra autores nacidos entre 1900 y 1940.

---

## 15. LIKE — Búsqueda por patrones

`LIKE` permite buscar coincidencias parciales. Los comodines son:
- `%` → cualquier secuencia de caracteres (incluso vacía)
- `_` → exactamente un carácter

```sql
SELECT titulo
FROM libros
WHERE titulo LIKE 'La%';
```

Devuelve libros cuyo título **comience** con `'La'`.

---

## 16. LIKE con comodín en ambos extremos

```sql
SELECT titulo
FROM libros
WHERE titulo LIKE '%sol%';
```

Busca libros que contengan la cadena `'sol'` en cualquier parte del título (por ejemplo, "Cien años de **sol**edad").

---

## 17. LIKE con comodín `_` (un solo carácter)

```sql
SELECT nombre
FROM usuarios
WHERE nombre LIKE '___a%';
```

Busca usuarios cuyo nombre tenga exactamente tres caracteres cualquiera seguidos de una `'a'`. Esto coincidiría, por ejemplo, con "**Ana** Martínez".

---

## 18. IS NULL — Buscar valores nulos

`NULL` representa la **ausencia de valor**. No se puede comparar con `=`, se debe usar `IS NULL`.

```sql
SELECT id_prestamo, id_libro, fecha_prestamo
FROM prestamos
WHERE fecha_devolucion IS NULL;
```

Devuelve los préstamos que **aún no fueron devueltos** (sin fecha de devolución).

---

## 19. IS NOT NULL — Buscar valores no nulos

```sql
SELECT id_prestamo, fecha_devolucion
FROM prestamos
WHERE fecha_devolucion IS NOT NULL;
```

Devuelve los préstamos que **sí tienen** una fecha de devolución registrada.

---

## 20. ORDER BY — Ordenar resultados (ascendente)

`ORDER BY` ordena el resultado. Por defecto el orden es **ascendente** (`ASC`).

```sql
SELECT titulo, anio_publicacion
FROM libros
ORDER BY anio_publicacion ASC;
```

Lista los libros desde el más antiguo al más reciente.

---

## 21. ORDER BY descendente

```sql
SELECT nombre_autor, fecha_nacimiento
FROM autores
ORDER BY fecha_nacimiento DESC;
```

Muestra los autores desde el más joven al más viejo.

---

## 22. ORDER BY con múltiples columnas

Cuando dos filas tienen el mismo valor en la primera columna de ordenamiento, se utiliza la segunda para desempatar.

```sql
SELECT titulo, genero, anio_publicacion
FROM libros
ORDER BY genero ASC, anio_publicacion DESC;
```

Ordena primero por género alfabéticamente y, dentro de cada género, por año de publicación de mayor a menor.

---

## 23. LIMIT — Restringir cantidad de resultados

`LIMIT` acota el número de filas devueltas. Es muy útil para paginar resultados o explorar datos.

```sql
SELECT titulo, anio_publicacion
FROM libros
ORDER BY anio_publicacion ASC
LIMIT 3;
```

Devuelve los 3 libros más antiguos.

---

## 24. LIMIT con OFFSET — Paginación

`OFFSET` indica cuántas filas saltar antes de empezar a devolver resultados.

```sql
SELECT titulo, anio_publicacion
FROM libros
ORDER BY anio_publicacion ASC
LIMIT 3 OFFSET 3;
```

Salta los primeros 3 libros y devuelve los siguientes 3 (útil para la "página 2" de resultados).

---

## 25. DISTINCT — Eliminar duplicados

`DISTINCT` elimina las filas repetidas del resultado.

```sql
SELECT DISTINCT nacionalidad
FROM autores;
```

Devuelve cada nacionalidad una sola vez, sin repeticiones (Argentina aparece solo una vez).

---

## 26. DISTINCT con múltiples columnas

```sql
SELECT DISTINCT genero
FROM libros
ORDER BY genero;
```

Lista todos los géneros únicos presentes en la tabla de libros, ordenados alfabéticamente.

---

## 27. COUNT — Contar filas

`COUNT()` es una **función de agregación** que cuenta la cantidad de filas.

```sql
SELECT COUNT(*) AS total_libros
FROM libros;
```

Devuelve la cantidad total de libros registrados en la tabla.

---

## 28. COUNT con condición

```sql
SELECT COUNT(*) AS prestamos_pendientes
FROM prestamos
WHERE devuelto = 0;
```

Cuenta cuántos préstamos **no han sido devueltos** todavía.

---

## 29. Funciones de agregación: MIN y MAX

`MIN()` devuelve el valor mínimo y `MAX()` el valor máximo de una columna.

```sql
SELECT
    MIN(anio_publicacion) AS publicacion_mas_antigua,
    MAX(anio_publicacion) AS publicacion_mas_reciente
FROM libros;
```

Muestra el año de publicación del libro más antiguo y del más reciente en una sola consulta.

---

## 30. Expresiones calculadas y concatenación

Podemos realizar cálculos y transformaciones directamente en el `SELECT`. La función `CONCAT()` une cadenas de texto.

```sql
SELECT
    CONCAT(nombre_autor, ' (', nacionalidad, ')') AS autor_info,
    YEAR(CURDATE()) - YEAR(fecha_nacimiento) AS edad_aproximada
FROM autores
ORDER BY edad_aproximada DESC;
```

Genera una columna con el nombre y la nacionalidad entre paréntesis, y calcula la edad aproximada de cada autor.

---

## Resumen de cláusulas y operadores vistos

| Cláusula / Operador | Descripción |
|---|---|
| `SELECT` | Define qué columnas recuperar |
| `FROM` | Indica la tabla de origen |
| `WHERE` | Filtra filas según condiciones |
| `AND`, `OR` | Combinan condiciones lógicas |
| `IN`, `NOT IN` | Pertenencia o exclusión de un conjunto |
| `BETWEEN` | Rango inclusivo de valores |
| `LIKE` | Búsqueda por patrones (`%`, `_`) |
| `IS NULL`, `IS NOT NULL` | Verificar valores nulos |
| `ORDER BY` | Ordenar resultados (`ASC` / `DESC`) |
| `LIMIT`, `OFFSET` | Restringir y paginar resultados |
| `DISTINCT` | Eliminar filas duplicadas |
| `COUNT`, `MIN`, `MAX` | Funciones de agregación |
| `AS` | Alias para columnas o expresiones |
| `CONCAT()` | Concatenar cadenas de texto |
