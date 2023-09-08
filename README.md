# PruebasAlgoritmos2  
Script de bash para correr las pruebas del obligatorio automáticamente. 
Solo se corren las pruebas de los ejercicios que existen en el directorio en el que se ejecuta (verifica si existe ejercicio1.cpp, ejercicio2.cpp,...,etc, antes de correr las pruebas correspondientes).
A medida que se agreguen más ejercicios se actualizará el script para incluir soporte para ellos: ver [Ejercicios soportados](#ejercicios-soportados).

## Uso

1. Coloca el script en el mismo directorio que los ejercicios que deseas probar (`ejercicio1.cpp`, `ejercicio2.cpp`, etc.).

2. Ejecuta el script:

```  
chmod +x pruebas.sh  
./pruebas.sh  
```  
o
```  
bash pruebas.sh  
```  
## Funcionamiento

El script realiza los siguientes pasos:

- Verifica si los ejercicios existen en el directorio actual
- Compila los ejercicios que existen utilizando `g++ -std=c++11`
- Genera los archivos de salida para pruebas.
- Ejecuta las pruebas utilizando `diff --strip-trailing-cr -y` y compara las salidas generadas con las salidas esperadas.
- Borra los archivos generados (.out.mine.txt, .out)
## Ejercicios soportados
- [x] 1
- [x] 2
- [ ] 3
- [ ] 4
- [ ] 5
- [ ] 6
- [ ] 7
- [ ] 8
- [ ] 9
- [ ] 10
