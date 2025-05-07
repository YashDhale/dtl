#!/bin/bash

# Prompt the user
read -p "Enter first number: " num1
read -p "Enter second number: " num2

# Multiply using arithmetic expansion
result=$((num1 * num2))

# Display the result
echo "Result: $num1 * $num2 = $result"

