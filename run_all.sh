#!/bin/bash

# clean
make clean > /dev/null 2>&1
# compile
make > /dev/null 2>&1
# create directory
mkdir output

for i in {1..3}
do
    echo "Example no ${i}:"
    # run with each input and print output to Main.java
    make execute < input/example${i} > output/Main.java
    cp output/Main.java output/example${i}
    # compile Main.java
    javac ./output/Main.java
    # run Main.class
    java -classpath output Main
    printf "\n"
done