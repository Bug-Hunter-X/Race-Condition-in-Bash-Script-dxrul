#!/bin/bash

# This script demonstrates how to prevent a race condition using flock

file=/tmp/my_file
echo "" > $file  # Initialize the file

process1() {
  for i in {1..10}; do
    flock -x <(echo) # Acquires an exclusive lock
    echo "Process 1: Iteration $i" >> $file
    sleep 0.1  # Simulate some work
    flock -u <(echo) # Releases the lock
  done
}

process2() {
  for i in {1..10}; do
    flock -x <(echo) # Acquires an exclusive lock
    echo "Process 2: Iteration $i" >> $file
    sleep 0.1  # Simulate some work
    flock -u <(echo) # Releases the lock
  done
}

# Run the processes concurrently
process1 & process2 &
wait  # Wait for both processes to finish

# Print the contents of the file
cat $file