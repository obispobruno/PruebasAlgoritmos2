![demostracion](dem.gif)
# PruebasAlgoritmos2  
Script de bash para correr las pruebas del obligatorio. Soporta c++ y java.
A medida que se suban las pruebas se actualizará para incluir soporte: ver [Ejercicios soportados](#ejercicios-soportados).

## Cómo Usar el Script

**1. Formato de la carpeta ejercicios**

Coloca el script en tu directorio de ejercicios. El mismo **debe** tener el siguiente formato:

En C++:
```
.
├── Pruebas
│   ├── Ejercicio1
│   ├── Ejercicio2
│   ├── Ejercicio3
│   ├── Ejercicio4
│   └── Ejercicio5
├── ejercicio1.cpp
├── ejercicio2.cpp
├── ejercicio3.cpp
├── ejercicio4.cpp
└── pruebas.sh
```
En java:
```
.
├── Pruebas
│   ├── Ejercicio1
│   ├── Ejercicio2
│   ├── Ejercicio3
│   ├── Ejercicio4
│   └── Ejercicio5
├── Ejercicio1.java
├── Ejercicio2.java
├── Ejercicio3.java
├── Ejercicio4.java
└── pruebas.sh
```
- La carpeta **Pruebas** se genera al descomprimir el zip del [Drive de pruebas](https://drive.google.com/drive/folders/1_Lx4PVyFqzYHEYeCPD8w8RH0fdTyX92N).
- Es importante que los nombres de los ejercicios tengan el siguiente formato: `Ejercicio1.java` o `ejercicio1.cpp`

**2. Cómo correr todas las pruebas**

Si ejecutas el script sin argumentos, correrá las pruebas de todos los ejercicios existentes en el directorio actual:
```
./pruebas.sh
```

**3. Cómo correr pruebas de uno o varios ejercicios específicos**

Pasa como argumento los números de los ejercicios. Ejemplo para solo correr las pruebas de los ejercicios 1 y 2:
```
./pruebas.sh 1 2
```
Solo ejercicio 1:
```
./pruebas.sh 1
```

## Funcionamiento

- Detecta si existen archivos .java
- Verifica qué ejercicios existen en el directorio actual
- Compila los ejercicios que existen utilizando `g++ -std=c++11` o `javac`
- Genera los archivos de salida para pruebas (.out.mine.txt)
- Compara las salidas generadas con las salidas esperadas utilizando `diff --strip-trailing-cr`
- Borra los archivos generados (.out.mine.txt, .out)<sup>*</sup>

<sup>*Las salidas incorrectas no son borradas.

## Ejercicios soportados
- [x] Ejercicio 1
- [x] Ejercicio 2
- [x] Ejercicio 3
- [x] Ejercicio 4
- [x] Ejercicio 5
- [x] Ejercicio 6
- [x] Ejercicio 7
- [x] Ejercicio 8
- [ ] Ejercicio 9
- [ ] Ejercicio 10
