#!/bin/bash


get_syn() {
	/usr/local/WordNet-3.0/bin/wn $word -synsa 2>/dev/null|
	grep '=>'|
	tr "," "\n"|
	tr -d "=>"|
	tr "()" " "|
	awk {'print $1'}|
	grep -v '-'
} 


main() {
	word="$seed"
	results=$(get_syn $word)
	for word in $results; do
		get_syn $word 
	done|sort|uniq
}


seed=$@
main
