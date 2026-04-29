# Comenzamos con las consultas en MongoDB

¡Bienvenidos/as a la primera práctica con MongoDB! 🎉

Para arrancar con el pie derecho, vamos a hacerlo en **dos pasos muy simples**.

---

## Paso 1 — Leer el material teórico

Antes de tocar la consola, lean el documento que dejé en el **Moodle** de la materia:

> 📄 **`mongoDBPorConsola.pdf`**

Ese PDF es el punto de partida: explica qué es MongoDB, cómo funciona el shell `mongosh`, los comandos básicos para moverse entre bases de datos y colecciones, y la lógica general detrás del modelo orientado a documentos. Sin esa base, las consultas que vamos a hacer después no van a tener mucho sentido.

**Tómense su tiempo con el PDF.** No es largo, pero es la puerta de entrada al mundo de MongoDB y les va a ahorrar muchas dudas más adelante.

---

## Paso 2 — Importar los datos de práctica

Una vez que leyeron el PDF y tienen instalado MongoDB en sus computadoras, necesitan **cargar las colecciones** con las que vamos a trabajar durante toda la cursada.

Para eso, vayan al archivo:

> 📂 [`../data_files/LEEME.md`](../data_files/LEEME.md)

Ahí van a encontrar **paso a paso** cómo:

1. Verificar que tengan instalado `mongoimport`.
2. Importar los 7 archivos JSON (`libros`, `articulos`, `clientes`, `medicamentos`, `alumnos`, `empleados`, `posts`) a una base de datos llamada `base1`.
3. Verificar desde `mongosh` que todas las colecciones se hayan creado correctamente.
4. Resolver los errores más comunes que pueden aparecer durante la importación.

Sigan ese instructivo con paciencia y, cuando los `countDocuments()` les devuelvan los números esperados, **ya están listos/as para empezar a consultar**. 🚀

---

## ¿Y después?

Cuando hayan completado los dos pasos anteriores, van a poder empezar con los ejercicios de consultas que iremos viendo en clase y que se irán publicando en esta misma carpeta `practica/`.

> 💡 **Consejo**: Tengan siempre a mano el PDF de Moodle mientras hacen los ejercicios. Es normal volver a consultarlo varias veces hasta que los comandos básicos les salgan de memoria.

¡Cualquier duda, la charlamos en clase o por el foro de Moodle!
