# Revisando la instrucción `rlf` y repasando otras instrucciones

Este código está diseñado para explorar el funcionamiento de la instrucción **`rlf`** (Rotate Left through Carry) y recordar cómo funcionan otras instrucciones importantes del ensamblador para microcontroladores PIC, como **`decfsz`**.

---

## Instrucción: **`decfsz`**

### **Descripción**
La instrucción `decfsz` significa **DECrement File Register, Skip if Zero** y realiza las siguientes acciones:

1. Decrementa el contenido del registro especificado.
2. Si el resultado del decremento es **cero**, la instrucción siguiente se **salta**.
3. Si el resultado **no es cero**, la ejecución continúa con la siguiente instrucción normalmente.

---

### **Parámetros: `1`/`F` y `0`/`W`**
En los ensambladores para microcontroladores PIC, los parámetros `1` y `F` tienen el mismo significado, y su elección define dónde se almacenará el resultado del decremento:

- **`1` o `F`**: El resultado del decremento se almacena en el registro fuente (por ejemplo, `conta`).
- **`0` o `W`**: El resultado del decremento se almacena en el acumulador **W** (Working Register), dejando el registro fuente intacto.

---

## Registro W: **El Acumulador**
El registro **W** (Working Register) es un registro especial utilizado como **acumulador**. Sirve como intermediario para mover, modificar o usar datos en operaciones.

### **Ejemplo de Uso**:
```assembly
movlw 0x05      ; Carga el valor 5 en W
movwf conta      ; Mueve el valor de W al registro conta
```
En este caso:
- El valor `5` se almacena primero en `W`.
- Luego, se copia desde `W` al registro `conta`.

---

## Registro F: **File Register**
El término **F** se refiere al **File Register**, o registro de destino. Especifica que el resultado de una operación se debe guardar directamente en un registro específico.

### **Ejemplo Comparativo**
1. **Decremento en el registro fuente:**
   ```assembly
   decfsz conta, F ; Guarda el resultado en conta
   ```

2. **Decremento en el acumulador:**
   ```assembly
   decfsz conta, W ; Guarda el resultado en W, dejando conta sin cambios
   ```

---

## Notas Finales
Este ejercicio refuerza conceptos clave sobre el manejo de registros y operaciones básicas en ensamblador para microcontroladores PIC. Explorar instrucciones como `decfsz` y `rlf` ayuda a consolidar la comprensión de los flujos de control y manipulación de datos en este entorno.


