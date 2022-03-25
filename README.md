## Language Translator to Java

This program translates a series of lines, written in pseudocode, into java programs, simulating a very simplistic Compiler.
More precisely, the language supports the following operations:
- concatenation of strings
- string reverse
- function declarations and function calls
- if and else statements
- string prefix check

In this project I experimented with JFlex, a scanner generator, and JavaCup, a parser generator for Java.
First of all, I had to define the alphabet of the language, using simple regular expressions.
Then, I created the context-free grammar, specifying the terminals, nonterminals and also the precedence of the terminals.

I have also provided a bash script to automate the compilation and running of the program for each of the given examples. This creates a new folder than contains the output Java programs. Furthermore, it prints to stdout the results.

As far as the grammar is concerned, I tried to make it as straightforward as possible, so that I can understand it myself.
The nonterminals I used are the following ones:
- program &rarr the goal, it contains function declarations and function calls 
- functions, function &rarr one or more function declarations
- calls, call &rarr one or more function calls
- args &rarr the arguments of a function as defined in the declaration
- passed_args &rarr the arguments passed to a function, can be all kinds of things
- prefix &rarr string prefix check
- expr &rarr can be if statement, function call, a concatenation, an identifier, a string literal or a reverse expression

The main challenge I had to cope with was the differantiation of the function declaration and the function call, which I handled using the regex ') {'.

### Install Dependencies
```
$ sudo apt-get install jflex
```

### Compile & Run
```
$ ./run_all.sh
```