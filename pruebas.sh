#!/bin/bash

correrPrueba() {
  echo '---------------------------'
  echo "Prueba $2.in.txt:"
  ./ejercicio$1.out < $2.in.txt > $2.out.mine.txt
  output=$(diff --strip-trailing-cr $2.out.mine.txt $2.out.txt)
  if [ -z "$output" ]; then
    echo "OK"
  else
    echo "ERROR"
    diff --strip-trailing-cr $2.out.mine.txt $2.out.txt
  fi
}

if [ -f ejercicio1.cpp ]; then
  echo '---------------------------'
  echo '    Pruebas Ejercicio 1    '
  g++ -std=c++11 ejercicio1.cpp -o ejercicio1.out
  if  [ $? -ne 0 ]; then
    echo "Error de compilación"
    exit 1
  fi
  for ((i = 10; i <= 1000000; i*=10)); do
    correrPrueba 1 ${i}
  done
fi

if [ -f ejercicio2.cpp ]; then
  echo '---------------------------'
  echo '    Pruebas Ejercicio 2    '
  g++ -std=c++11 -o ejercicio2.out ejercicio2.cpp
  if  [ $? -ne 0 ]; then
    echo "Error de compilación"
    exit 1
  fi
  for ((i = 10; i <= 1000000; i*=10)); do
    correrPrueba 2 2_${i}
    correrPrueba 2 5_${i}
  done
fi

rm *.out.mine.txt
rm *.out
