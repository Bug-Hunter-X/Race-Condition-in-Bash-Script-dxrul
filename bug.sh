#!/bin/bash

# This script demonstrates a race condition where two processes try to modify the same file simultaneously.

file=/tmp/my_file
echo "" > $file  # Initialize the file

process1() {
  for i in {1..10}; do
    echo "Process 1: Iteration $i" >> $file
    sleep 0.1  # Simulate some work
  done
}

process2() {
  for i in {1..10}; do
    echo "Process 2: Iteration $i" >> $file
    sleep 0.1  # Simulate some work
  done
}

# Run the processes concurrently
process1 & process2 &
wait  # Wait for both processes to finish

# Print the contents of the file
cat $file