#!/bin/bash

existe() {
  if [ ! -f "$1" ]; then
    return 1
  fi
}

compilar() {
  g++ -std=c++11 ejercicio"$1".cpp -o ejercicio"$1".out || { echo "Error de compilación. Abortando prueba"; return 1; }
}

comparar() {
  echo '---------------------------'
  echo -n "$2.in.txt: "
  ./ejercicio"$1".out < Pruebas/Ejercicio"$1"/"$2".in.txt > Pruebas/Ejercicio"$1"/"$2".out.mine.txt || { echo "Error de ejecución"; return 1; }
  output=$(diff --strip-trailing-cr Pruebas/Ejercicio"$1"/"$2".out.mine.txt Pruebas/Ejercicio"$1"/"$2".out.txt)
  if [ -z "$output" ]; then
    echo "OK"
    rm Pruebas/Ejercicio"$1"/"$2".out.mine.txt 2> /dev/null
  else
    echo "ERROR"
  fi
}

correrPrueba() {
  existe ejercicio"$1".cpp || return 1
  echo '---------------------------'
  echo "        Ejercicio $1       "
  compilar "$1" || return 1
  for ((i = 10; i <= 1000000; i*=10)); do
    comparar "$1" $i
  done
}

pruebasEjercicio2() {
  existe ejercicio2.cpp || return 1
  echo '---------------------------'
  echo "        Ejercicio 2        "
  compilar 2 || return 1
  for ((i = 10; i <= 1000000; i*=10)); do
    comparar 2 2_$i
    comparar 2 5_$i
  done
}

pruebasEjercicio4() {
  existe ejercicio4.cpp || return 1
  echo '---------------------------'
  echo "        Ejercicio 4        "
  compilar 4 || return 1
  comparar 4 5
  comparar 4 10
  comparar 4 100
  comparar 4 1000
}

pruebasEjercicio5() {
  existe ejercicio5.cpp || return 1
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
  case $1 in
    1)
      correrPrueba 1 || echo "No existe ejercicio1.cpp"
      ;;
    2)
      pruebasEjercicio2 || echo "No existe ejercicio2.cpp"
      ;;
    3)
      correrPrueba 3 || echo "No existe ejercicio3.cpp"
      ;;
    4)
      pruebasEjercicio4 || echo "No existe ejercicio4.cpp"
      ;;
    5)
      pruebasEjercicio5 || echo "No existe ejercicio5.cpp"
      ;;
    *)
      echo "Ejercicio $1: inválido / no soportado"
      ;;
  esac
  shift
done

rm ./*.out 2> /dev/null
