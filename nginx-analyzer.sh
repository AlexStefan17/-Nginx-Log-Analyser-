#!/bin/bash
Log_file="nginx.log"
echo "Top 5 IP addresses with the most requests:"
awk '{print $1}' "$Log_file" | sort | uniq -c | sort -nr | head -n 5 | awk '{print $2 " - " $1 " requests"}'
echo

echo "Top 5 most requested paths:"
awk '{print $7}' "$Log_file" | sort | uniq -c | sort -nr | head -n 5 | awk '{print $2 " - " $1 " requests"}'
echo

echo "Top 5 response status codes:"
awk '{print $9}' "$Log_file" | sort | uniq -c | sort | head -n 5 | awk '{print $2 " - " $1 " requests"}'
echo

echo "Top 5 user agents"