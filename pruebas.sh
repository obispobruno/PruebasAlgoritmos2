#!/bin/bash

if [ -f ejercicio1.cpp ]; then
  echo -e '\n--- Pruebas Ejercicio 1 ---'
  g++ -std=c++11 ejercicio1.cpp -o ejercicio1.out
  a=10
  for i in {1..5}; do
    ./ejercicio1.out < ${a}.in.txt > ${a}.out.mine.txt
    ./ejercicio1.out < ${a}.in.txt > ${a}.out.mine.txt
    output=$(diff --strip-trailing-cr ${a}.out.mine.txt ${a}.out.txt)
    echo "Prueba ${a}.in.txt:"
    if [ -z "$output" ]; then
      echo "OK"
    else
      echo "ERROR"
      diff --strip-trailing-cr -y ${a}.out.mine.txt ${a}.out.txt
    fi
    a=$((a*10))
  done
fi

if [ -f ejercicio2.cpp ]; then
  echo -e '\n--- Pruebas Ejercicio 2 ---'
  g++ -std=c++11 -o ejercicio2.out ejercicio2.cpp
  a=10
  for i in {1..5}; do
    ./ejercicio2.out < 2_${a}.in.txt > 2_${a}.out.mine.txt
    ./ejercicio2.out < 5_${a}.in.txt > 5_${a}.out.mine.txt
    output=$(diff --strip-trailing-cr 2_${a}.out.mine.txt 2_${a}.out.txt)
    echo "Prueba 2_${a}.in.txt:"
    if [ -z "$output" ]; then
      echo "OK"
    else
      echo "ERROR"
      echo $output
    fi
    output=$(diff --strip-trailing-cr 5_${a}.out.mine.txt 5_${a}.out.txt)
    echo "Prueba 5_${a}.in.txt:"
    if [ -z "$output" ]; then
      echo "OK"
    else
      echo "ERROR"
      diff --strip-trailing-cr -y 5_${a}.out.mine.txt 5_${a}.out.txt
    fi
    a=$((a*10))
  done
fi

rm *.out.mine.txt
rm *.out
