#!/bin/bash

#SBATCH -J ReEval1.1

#SBATCH --time=24:00:00

#SBATCH -N 1

#SBATCH --ntasks-per-node 5

#SBATCH -o ReEval1.1-%j.out

#SBATCH --qos janus

(CONTROL_FILE="AllDecAll1_control.txt"

for f in form_* 
do
       	FORMATTED_FILE=$(echo $f | awk -F '.' '{print $1}')
        cp ${CONTROL_FILE} ${FORMATTED_FILE}_1_control.txt
        ./lrgvForMOEAFramework -m std-io -b ${FORMATTED_FILE}_1 -c combined < $f > eval1_$f
        rm ${FORMATTED_FILE}_1_control.txt
done) &

(CONTROL_FILE="AllDecAll2_control.txt"

for f in form_* 
do
       	FORMATTED_FILE=$(echo $f | awk -F '.' '{print $1}')
        cp ${CONTROL_FILE} ${FORMATTED_FILE}_2_control.txt
        ./lrgvForMOEAFramework -m std-io -b ${FORMATTED_FILE}_2 -c combined < $f > eval1_$f
        rm ${FORMATTED_FILE}_2_control.txt
done) &

(CONTROL_FILE="AllDecAll3_control.txt"

for f in form_*
do
       	FORMATTED_FILE=$(echo $f | awk -F '.' '{print $1}')
        cp ${CONTROL_FILE} ${FORMATTED_FILE}_3_control.txt
        ./lrgvForMOEAFramework -m std-io -b ${FORMATTED_FILE}_3 -c combined < $f > eval1_$f
        rm ${FORMATTED_FILE}_3_control.txt
done) &

(CONTROL_FILE="AllDecAll4_control.txt"

for f in form_*
do
       	FORMATTED_FILE=$(echo $f | awk -F '.' '{print $1}')
        cp ${CONTROL_FILE} ${FORMATTED_FILE}_4_control.txt
        ./lrgvForMOEAFramework -m std-io -b ${FORMATTED_FILE}_4 -c combined < $f > eval1_$f
        rm ${FORMATTED_FILE}_4_control.txt
done) &

(CONTROL_FILE="AllDecAll5_control.txt"

for f in form_*
do
       	FORMATTED_FILE=$(echo $f | awk -F '.' '{print $1}')
        cp ${CONTROL_FILE} ${FORMATTED_FILE}_5_control.txt
        ./lrgvForMOEAFramework -m std-io -b ${FORMATTED_FILE}_5 -c combined < $f > eval1_$f
        rm ${FORMATTED_FILE}_5_control.txt
done) &

wait

EOF
