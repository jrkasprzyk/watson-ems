#!/bin/bash

for f in pareto*
do
	sed '/^#/ d' < $f | cut -d " " -f 1-8 > form_${f}
done
