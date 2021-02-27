#!/bin/bash


num=$1
t=0

touch directories.list
echo "line one's line" > directories.list
ls -la >> directories.list
head 3 directories.list 

for t in $num 
do 
	head 3 directories.list
	t=$t+1
done