Acá van todos los comandos en orden:

---

## 1. Crear la base de datos

```sql
CREATE DATABASE mi_base CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

---

## 2. Crear el usuario con control total

```sql
CREATE USER 'usuario_admin'@'localhost' IDENTIFIED BY 'PasswordSeguro123!';
GRANT ALL PRIVILEGES ON mi_base.* TO 'usuario_admin'@'localhost';
```

---

## 3. Crear el usuario de solo lectura

```sql
CREATE USER 'usuario_readonly'@'localhost' IDENTIFIED BY 'OtroPassword456!';
GRANT SELECT ON mi_base.* TO 'usuario_readonly'@'localhost';
```

---

## 4. Aplicar los cambios

```sql
FLUSH PRIVILEGES;
```

---

## 5. Verificar que quedó bien

```sql
-- Ver permisos del admin
SHOW GRANTS FOR 'usuario_admin'@'localhost';

-- Ver permisos del readonly
SHOW GRANTS FOR 'usuario_readonly'@'localhost';
```

---

### Notas importantes

- Reemplazá `mi_base`, `usuario_admin`, `usuario_readonly` y las contraseñas por los valores reales.
- Si el usuario necesita conectarse **desde otra máquina** en lugar de `localhost`, usá `'%'` o la IP específica:
  ```sql
  CREATE USER 'usuario_admin'@'%' IDENTIFIED BY 'PasswordSeguro123!';
  ```
- En MySQL 8 las contraseñas tienen política de seguridad activa por defecto, así que deben tener mayúsculas, números y caracteres especiales.

¿Querés también los comandos para revocar permisos o eliminar usuarios?