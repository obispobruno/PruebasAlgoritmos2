#!/bin/bash

java=false
for i in *.java; do
  if [ -f "$i" ]; then
    java=true
  fi
done

existe() {
  if [ ! -f "$1" ]; then
    return 2
  fi
}

compilar() {
  if "$java"; then
    javac Ejercicio"$1".java || { echo "Error de compilación. Abortando prueba"; return 1; }
  else
    g++ -std=c++11 ejercicio"$1".cpp -o ejercicio"$1".out || { echo "Error de compilación. Abortando prueba"; return 1; }
  fi
}

comparar() {
  echo '---------------------------'
  echo -n "$2.in.txt: "
  if "$java"; then
    java Ejercicio"$1" < Pruebas/Ejercicio"$1"/"$2".in.txt > Pruebas/Ejercicio"$1"/"$2".out.mine.txt || { echo "Error de ejecución"; return 1; }
  else
    ./ejercicio"$1".out < Pruebas/Ejercicio"$1"/"$2".in.txt > Pruebas/Ejercicio"$1"/"$2".out.mine.txt || { echo "Error de ejecución"; return 1; }
  fi
  output=$(diff --strip-trailing-cr Pruebas/Ejercicio"$1"/"$2".out.mine.txt Pruebas/Ejercicio"$1"/"$2".out.txt)
  if [ -z "$output" ]; then
    echo "OK"
    rm Pruebas/Ejercicio"$1"/"$2".out.mine.txt 2> /dev/null
  else
    echo "ERROR"
  fi
}

correrPrueba() {
  if "$java"; then
    existe Ejercicio"$1".java || return 2
  else
    existe ejercicio"$1".cpp || return 2
  fi
  echo '---------------------------'
  echo "        Ejercicio $1       "
  compilar "$1" || return 1
  for ((i = 10; i <= 1000000; i*=10)); do
    comparar "$1" $i
  done
}

pruebasEjercicio2() {
  if "$java"; then
    existe Ejercicio2.java || return 2
  else
    existe ejercicio2.cpp || return 2
  fi
  echo '---------------------------'
  echo "        Ejercicio 2        "
  compilar 2 || return 1
  for ((i = 10; i <= 1000000; i*=10)); do
    comparar 2 2_$i
    comparar 2 5_$i
  done
}

pruebasEjercicio4() {
  if "$java"; then
    existe Ejercicio4.java || return 2
  else
    existe ejercicio4.cpp || return 2
  fi
  echo '---------------------------'
  echo "        Ejercicio 4        "
  compilar 4 || return 1
  comparar 4 5
  comparar 4 10
  comparar 4 100
  comparar 4 1000
}

pruebasEjercicio5() {
  if "$java"; then
    existe Ejercicio5.java || return 2
  else
    existe ejercicio5.cpp || return 2
  fi
  echo '---------------------------'
  echo "        Ejercicio 5        "
  compilar 5 || return 1
  comparar 5 5
  comparar 5 10
  comparar 5 20
  comparar 5 50
  comparar 5 100
  comparar 5 1000
}

if [[ $# -eq 0 ]]; then
  correrPrueba 1
  pruebasEjercicio2
  correrPrueba 3
  pruebasEjercicio4
  pruebasEjercicio5
fi

while [[ $# -gt 0 ]]; do
  if "$java"; then
    ext="java"
    nombre="Ejercicio"
  else
    nombre="ejercicio"
    ext="cpp"
  fi
  case $1 in
    1)
      correrPrueba 1; if [[ $? -eq 2 ]]; then echo "No existe $nombre$1.$ext"; fi
      ;;
    2)
      pruebasEjercicio2; if [[ $? -eq 2 ]]; then echo "No existe $nombre$1.$ext"; fi
      ;;
    3)
      correrPrueba 3; if [[ $? -eq 2 ]]; then echo "No existe $nombre$1.$ext"; fi
      ;;
    4)
      pruebasEjercicio4; if [[ $? -eq 2 ]]; then echo "No existe $nombre$1.$ext"; fi
      ;;
    5)
      pruebasEjercicio5; if [[ $? -eq 2 ]]; then echo "No existe $nombre$1.$ext"; fi
      ;;
    *)
      echo "Ejercicio $1: inválido / no soportado"
      ;;
  esac
  shift
done

rm ./*.out 2> /dev/null
