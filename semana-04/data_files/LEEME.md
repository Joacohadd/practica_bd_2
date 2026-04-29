# Datos de práctica - MongoDB Consola
## Colecciones incluidas

| Archivo            | Colección      | Documentos | Descripción                                  |
|--------------------|----------------|------------|----------------------------------------------|
| libros.json        | libros         | 15         | Libros con autor embebido y array editoriales|
| articulos.json     | articulos      | 15         | Artículos con rubro, precio y stock          |
| clientes.json      | clientes       | 12         | Clientes con dirección embebida              |
| medicamentos.json  | medicamentos   | 15         | Medicamentos con laboratorio y precio        |
| alumnos.json       | alumnos        | 10         | Alumnos con fecha de nacimiento              |
| empleados.json     | empleados      | 10         | Empleados con fecha de ingreso y salario     |
| posts.json         | posts          | 5          | Posts con array de comentarios embebidos     |

---

## Cómo importar los archivos

> ⚠️ **Importante**: `mongoimport` **NO** se ejecuta dentro del shell de MongoDB (`mongosh`). Es una herramienta aparte, parte de las **MongoDB Database Tools**, y se ejecuta directamente en la terminal del sistema operativo (CMD / PowerShell / bash).

### Paso 0 — Verificar que `mongoimport` esté instalado

En una terminal del sistema, ejecutá:

```bash
mongoimport --version
```

Si te devuelve la versión, está todo listo. Si te dice "comando no encontrado", instalá las **MongoDB Database Tools** desde:
<https://www.mongodb.com/try/download/database-tools>

### Paso 1 — Abrir una terminal y posicionarte en la carpeta de los archivos

Tenés que ejecutar los comandos desde la carpeta que contiene los archivos `.json`. Por ejemplo:

```bash
cd semana-04/data_files
```

### Paso 2 — Importar cada colección con `mongoimport`

Vamos a usar la base de datos `base1` (si no existe, MongoDB la crea automáticamente). Si querés usar otro nombre, reemplazalo en cada comando.

```bash
mongoimport --uri="mongodb://localhost:27017" --db=base1 --collection=libros       --file=libros.json       --jsonArray
mongoimport --uri="mongodb://localhost:27017" --db=base1 --collection=articulos    --file=articulos.json    --jsonArray
mongoimport --uri="mongodb://localhost:27017" --db=base1 --collection=clientes     --file=clientes.json     --jsonArray
mongoimport --uri="mongodb://localhost:27017" --db=base1 --collection=medicamentos --file=medicamentos.json --jsonArray
mongoimport --uri="mongodb://localhost:27017" --db=base1 --collection=alumnos      --file=alumnos.json      --jsonArray
mongoimport --uri="mongodb://localhost:27017" --db=base1 --collection=empleados    --file=empleados.json    --jsonArray
mongoimport --uri="mongodb://localhost:27017" --db=base1 --collection=posts        --file=posts.json        --jsonArray
```

### ¿Qué significa cada parámetro?

| Parámetro | Significado |
|---|---|
| `--uri="mongodb://localhost:27017"` | URL de conexión a tu MongoDB local. |
| `--db=base1` | Base de datos donde se va a importar. |
| `--collection=libros` | Nombre de la colección que se va a crear. |
| `--file=libros.json` | Archivo JSON a importar. |
| `--jsonArray` | **Imprescindible** porque cada archivo contiene un array `[ ... ]` con varios documentos. Sin este flag, `mongoimport` espera un documento por línea y falla. |

### Salida esperada

Por cada comando vas a ver algo similar a:

```
connected to: mongodb://localhost:27017
15 document(s) imported successfully. 0 document(s) failed to import.
```

### ¿Necesitás reimportar?

Si querés volver a importar una colección desde cero (por ejemplo, porque la modificaste haciendo pruebas), agregá el flag `--drop`. Eso elimina la colección antes de volver a importarla:

```bash
mongoimport --uri="mongodb://localhost:27017" --db=base1 --collection=libros --file=libros.json --jsonArray --drop
```

---

## Verificar la importación desde `mongosh`

Ahora sí abrí el shell de MongoDB en otra terminal:

```bash
mongosh
```

Y verificá que las colecciones estén creadas y con la cantidad correcta de documentos:

```js
use base1

show collections

db.libros.countDocuments()        // debe mostrar 15
db.articulos.countDocuments()     // debe mostrar 15
db.clientes.countDocuments()      // debe mostrar 12
db.medicamentos.countDocuments()  // debe mostrar 15
db.alumnos.countDocuments()       // debe mostrar 10
db.empleados.countDocuments()     // debe mostrar 10
db.posts.countDocuments()         // debe mostrar  5
```

Si todos los conteos son correctos, ya estás listo/a para empezar a practicar consultas.

---

## Estructura resumida de cada colección

### libros
```json
{
  "_id": 1,
  "titulo": "El aleph",
  "autor": { "nombre": "Jorge Luis Borges", "nacionalidad": "Argentina" },
  "editorial": ["Siglo XXI", "Planeta"],
  "precio": 20,
  "cantidad": 50
}
```

### articulos
```json
{
  "_id": 1,
  "nombre": "MULTIFUNCION HP DESKJET 2675",
  "rubro": "impresora",
  "precio": 3000,
  "stock": 20
}
```

### clientes
```json
{
  "_id": 1,
  "nombre": "Martinez Victor",
  "mail": "mvictor@gmail.com",
  "dni": "20439455",
  "direccion": { "calle": "Colon", "numero": 620, "codigopostal": 5000 }
}
```

### medicamentos
```json
{
  "_id": 1,
  "nombre": "Sertal",
  "laboratorio": "Roche",
  "precio": 5.2,
  "cantidad": 100
}
```

### alumnos
```json
{
  "_id": 20456123,
  "apellido": "Gonzalez",
  "nombre": "Ana",
  "domicilio": "Colon 123",
  "fechanacimiento": ISODate("1990-08-15")
}
```

### empleados
```json
{
  "_id": 20456234,
  "nombre": "Rodriguez Pablo",
  "departamento": "Sistemas",
  "salario": 85000,
  "fechaingreso": ISODate("2010-01-31")
}
```

### posts
```json
{
  "_id": 1,
  "titulo": "Lenguaje Java",
  "contenido": "...",
  "categoria": "programacion",
  "comentarios": [
    { "autor": "Marcos Paz", "mail": "...", "contenido": "..." }
  ]
}
```

---

## Nota sobre las fechas

Si abrís los archivos `alumnos.json` o `empleados.json`, vas a ver que las fechas están escritas así:

```json
"fechanacimiento": { "$date": "1990-08-15T03:00:00.000Z" }
```

Ese es el formato **Extended JSON** de MongoDB, el estándar que entiende `mongoimport` para representar fechas. Cuando los datos se importan a la base, ese objeto se convierte automáticamente al tipo `Date` de BSON, y al consultarlos desde `mongosh` los vas a ver como:

```js
ISODate("1990-08-15T03:00:00.000Z")
```

Eso permite usarlos en consultas con operadores de fecha (`$gt`, `$lt`, etc.) sin tener que hacer ninguna conversión manual.

---

## Solución de problemas frecuentes

| Problema | Causa probable / Solución |
|---|---|
| `command not found: mongoimport` | No tenés instaladas las **MongoDB Database Tools**. Instalalas desde el link del Paso 0. |
| `Failed: error connecting to db server: no reachable servers` | El servicio de MongoDB no está corriendo. En Linux: `sudo systemctl start mongod`. En Windows: iniciá el servicio "MongoDB" desde Servicios. |
| `Failed: cannot decode array into a Document` | Te olvidaste el flag `--jsonArray`. |
| `Failed: open libros.json: no such file or directory` | No estás parado/a en la carpeta correcta. Volvé al **Paso 1** y hacé `cd` a `semana-04/data_files`. |
| `E11000 duplicate key error` | Ya importaste antes esa colección. Usá el flag `--drop` para reimportar limpio. |
