#!/bin/bash

seeds="good bad"
for seed in $seeds; do
	cat $seed.seed|
	while read seed; do
		bash ./recurse.sh $seed
	done|sort|uniq >> $seed.list
done
