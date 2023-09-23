![demostracion](demo.gif)
# PruebasAlgoritmos2  
Script de bash para correr las pruebas del obligatorio. 
Solo se corren las pruebas de los ejercicios que existen en el directorio en el que se ejecuta (verifica si existe ejercicio1.cpp, ejercicio2.cpp,...,etc, antes de correr las pruebas correspondientes).
A medida que se agreguen más ejercicios se actualizará el script para incluir soporte para ellos: ver [Ejercicios soportados](#ejercicios-soportados).

## Uso

**1.**

Coloca el script en tu directorio de ejercicios. El mismo debe tener la siguiente estructura:
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
La carpeta `Pruebas` se genera al descomprimir el zip del [Drive de pruebas](https://drive.google.com/drive/folders/1_Lx4PVyFqzYHEYeCPD8w8RH0fdTyX92N).
Si no tienes todos los ejercicios no importa, el script verifica qué archivos existen y corre las pruebas correspondientes.

**2.**

Si quieres correr todas las pruebas simplemente ejecuta el script:
```
./pruebas.sh
```
Si solo quieres correr las pruebas de un ejercicio específico, pasa como parámetro el número del ejercicio. Ejemplo para solo correr las pruebas del ejercicio 1:
```
./pruebas.sh 1
```
La salida se ve así:
```
---------------------------
       Ejercicio 1
---------------------------
10.in.txt:
OK
---------------------------
100.in.txt:
OK
---------------------------
1000.in.txt:
OK
---------------------------
10000.in.txt:
OK
---------------------------
100000.in.txt:
OK
---------------------------
1000000.in.txt:
OK
```

## Funcionamiento

- Verifica si los ejercicios existen en el directorio actual
- Compila los ejercicios que existen utilizando `g++ -std=c++11`
- Genera los archivos de salida para pruebas
- Compara las salidas generadas con las salidas esperadas utilizando `diff --strip-trailing-cr`
- Borra los archivos generados (.out.mine.txt, .out)

## Ejercicios soportados
- [x] 1
- [x] 2
- [x] 3
- [x] 4
- [x] 5
- [ ] 6
- [ ] 7
- [ ] 8
- [ ] 9
- [ ] 10
