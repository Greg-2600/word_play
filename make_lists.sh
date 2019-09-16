#!/bin/bash

seeds="good bad"
for seed in $seeds; do
	cat $seed.seed|
	while read word; do
		bash ./recurse.sh $word 
	done|sort|uniq >> $seed.list
done
