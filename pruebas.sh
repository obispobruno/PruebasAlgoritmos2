#!/bin/bash

correrPrueba() {
  if [ -z $3 ]; then
    echo '---------------------------'
    echo "    Pruebas Ejercicio $1    "
  fi
  g++ -std=c++11 ejercicio${1}.cpp -o ejercicio${1}.out
  if  [ $? -ne 0 ]; then
    echo "Error de compilación. Abortando prueba"
    return
  fi
  for ((i = 10; i <= 1000000; i*=10)); do
    echo '---------------------------'
    echo "Prueba $2${i}.in.txt:"
    ./ejercicio$1.out < $2${i}.in.txt > $2${i}.out.mine.txt
    if [ $? -ne 0 ]; then
      echo "Error de ejecución"
    else
      output=$(diff --strip-trailing-cr $2${i}.out.mine.txt $2${i}.out.txt)
      if [ -z "$output" ]; then
        echo "OK"
      else
        echo "ERROR"
      fi
    fi

  done
}

if [ -f ejercicio1.cpp ]; then
  correrPrueba 1
fi

if [ -f ejercicio2.cpp ]; then
  correrPrueba 2 2_
  correrPrueba 2 5_ 0
fi

if [ -f ejercicio3.cpp ]; then
  correrPrueba 3
fi

rm *.out.mine.txt
rm *.out
