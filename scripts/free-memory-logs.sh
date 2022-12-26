#!/bin/bash

# Retrieve the amount of free and used memory
memory_info=$(free -m)

# Extract the amount of free memory from the output
free_memory=$(echo "$memory_info" | grep Mem | awk '{print $4}')

# Log the free memory to a file
echo "$(date): $free_memory MB free" >> /var/log/free-memory.log
