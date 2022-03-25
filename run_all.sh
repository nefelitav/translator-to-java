#!/bin/bash

# compile
make > /dev/null 2>&1
make clean
# run with first input and print output to Main.java
make execute < input/example1 > Main.java
# compile Main.java
javac Main.java
# run Main.class
java Main

# # run with second input and print output to Main.java
# make execute < input/example2 > Main.java
# # compile Main.java
# javac Main.java
# # run Main.class
# java Main

# # run with third input and print output to Main.java
# make execute < input/example3 > Main.java
# # compile Main.java
# javac Main.java
# # run Main.class
# java Main