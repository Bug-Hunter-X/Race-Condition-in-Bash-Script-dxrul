# Race Condition in Bash Script

This repository demonstrates a race condition in a bash script where two processes concurrently write to the same file. This can lead to unexpected or corrupted output. The solution involves using a locking mechanism to ensure exclusive access to the file.

## Bug Description
The script `bug.sh` launches two processes that write to the same file simultaneously. The interleaved writing can result in incomplete or scrambled lines in the file. 

## Solution
The `bugSolution.sh` script demonstrates how to solve this race condition using flock to acquire an exclusive lock on the file before writing and release it afterwards. This ensures that only one process can modify the file at any given time, preventing data corruption.