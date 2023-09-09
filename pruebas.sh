#!/bin/bash

if [ -f ejercicio1.cpp ]; then
  echo '---------------------------'
  echo '    Pruebas Ejercicio 1    '
  g++ -std=c++11 ejercicio1.cpp -o ejercicio1.out
  for ((i = 10; i <= 1000000; i*=10)) do
    ./ejercicio1.out < ${i}.in.txt > ${i}.out.mine.txt
    output=$(diff --strip-trailing-cr ${i}.out.mine.txt ${i}.out.txt)
    echo '---------------------------'
    echo "Prueba ${i}.in.txt:"
    if [ -z "$output" ]; then
      echo "OK"
    else
      echo "ERROR"
      diff --strip-trailing-cr -y ${i}.out.mine.txt ${i}.out.txt
    fi
  done
fi

if [ -f ejercicio2.cpp ]; then
  echo '---------------------------'
  echo '    Pruebas Ejercicio 2    '
  g++ -std=c++11 -o ejercicio2.out ejercicio2.cpp
  for ((i = 10; i <= 1000000; i*=10)) do
    ./ejercicio2.out < 2_${i}.in.txt > 2_${i}.out.mine.txt
    ./ejercicio2.out < 5_${i}.in.txt > 5_${i}.out.mine.txt
    output=$(diff --strip-trailing-cr 2_${i}.out.mine.txt 2_${i}.out.txt)
    echo '---------------------------'
    echo "Prueba 2_${i}.in.txt:"
    if [ -z "$output" ]; then
      echo "OK"
    else
      echo "ERROR"
      diff --strip-trailing-cr -y 5_${i}.out.mine.txt 5_${i}.out.txt
    fi
    output=$(diff --strip-trailing-cr 5_${i}.out.mine.txt 5_${i}.out.txt)
    echo '---------------------------'
    echo "Prueba 5_${i}.in.txt:"
    if [ -z "$output" ]; then
      echo "OK"
    else
      echo "ERROR"
      diff --strip-trailing-cr -y 5_${i}.out.mine.txt 5_${i}.out.txt
    fi
  done
fi

rm *.out.mine.txt
rm *.out
