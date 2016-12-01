#!/bin/bash 
 
#SBATCH -J Scen1-1to10sds
#SBATCH --time=35:00:00
#SBATCH -N 1
#SBATCH --ntasks-per-node 10
#SBATCH -o Scen1-%j.out
#SBATCH --qos janus-long
 
echo The job has begun

FILEBASE="AllDecAll1" 
	
(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s1.txt \
-F 5000 -f ${FILEBASE}_s1.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 1 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s2.txt \
-F 5000 -f ${FILEBASE}_s2.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 2 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s3.txt \
-F 5000 -f ${FILEBASE}_s3.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 3 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s4.txt \
-F 5000 -f ${FILEBASE}_s4.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 4 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s5.txt \
-F 5000 -f ${FILEBASE}_s5.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 5 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s6.txt \
-F 5000 -f ${FILEBASE}_s6.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 6 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s7.txt \
-F 5000 -f ${FILEBASE}_s7.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 7 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s8.txt \
-F 5000 -f ${FILEBASE}_s8.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 8 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s9.txt \
-F 5000 -f ${FILEBASE}_s9.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 9 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s10.txt \
-F 5000 -f ${FILEBASE}_s10.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 10 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s11.txt \
-F 5000 -f ${FILEBASE}_s11.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 11 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s12.txt \
-F 5000 -f ${FILEBASE}_s12.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 12 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s13.txt \
-F 5000 -f ${FILEBASE}_s13.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 13 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s14.txt \
-F 5000 -f ${FILEBASE}_s14.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 14 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s15.txt \
-F 5000 -f ${FILEBASE}_s15.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 15 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s16.txt \
-F 5000 -f ${FILEBASE}_s16.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 16 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s17.txt \
-F 5000 -f ${FILEBASE}_s17.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 17 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s18.txt \
-F 5000 -f ${FILEBASE}_s18.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 18 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s19.txt \
-F 5000 -f ${FILEBASE}_s19.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 19 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s20.txt \
-F 5000 -f ${FILEBASE}_s20.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 20 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s21.txt \
-F 5000 -f ${FILEBASE}_s21.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 21 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s22.txt \
-F 5000 -f ${FILEBASE}_s22.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 22 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s23.txt \
-F 5000 -f ${FILEBASE}_s23.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 23 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s24.txt \
-F 5000 -f ${FILEBASE}_s24.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 24 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s25.txt \
-F 5000 -f ${FILEBASE}_s25.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 25 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s26.txt \
-F 5000 -f ${FILEBASE}_s26.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 26 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s27.txt \
-F 5000 -f ${FILEBASE}_s27.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 27 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s28.txt \
-F 5000 -f ${FILEBASE}_s28.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 28 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s29.txt \
-F 5000 -f ${FILEBASE}_s29.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 29 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s30.txt \
-F 5000 -f ${FILEBASE}_s30.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 30 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s31.txt \
-F 5000 -f ${FILEBASE}_s31.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 31 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s32.txt \
-F 5000 -f ${FILEBASE}_s32.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 32 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s33.txt \
-F 5000 -f ${FILEBASE}_s33.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 33 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s34.txt \
-F 5000 -f ${FILEBASE}_s34.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 34 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s35.txt \
-F 5000 -f ${FILEBASE}_s35.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 35 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s36.txt \
-F 5000 -f ${FILEBASE}_s36.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 36 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s37.txt \
-F 5000 -f ${FILEBASE}_s37.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 37 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s38.txt \
-F 5000 -f ${FILEBASE}_s38.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 38 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s39.txt \
-F 5000 -f ${FILEBASE}_s39.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 39 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s40.txt \
-F 5000 -f ${FILEBASE}_s40.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 40 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s41.txt \
-F 5000 -f ${FILEBASE}_s41.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 41 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s42.txt \
-F 5000 -f ${FILEBASE}_s42.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 42 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s43.txt \
-F 5000 -f ${FILEBASE}_s43.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 43 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s44.txt \
-F 5000 -f ${FILEBASE}_s44.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 44 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s45.txt \
-F 5000 -f ${FILEBASE}_s45.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 45 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s46.txt \
-F 5000 -f ${FILEBASE}_s46.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 46 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s47.txt \
-F 5000 -f ${FILEBASE}_s47.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 47 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s48.txt \
-F 5000 -f ${FILEBASE}_s48.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 48 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s49.txt \
-F 5000 -f ${FILEBASE}_s49.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 49 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

(./borg.exe -v 8 -o 6 -c 4 -C E -R ${FILEBASE}_runtime_s50.txt \
-F 5000 -f ${FILEBASE}_s50.txt -l 0,0,0,0.1,0,0,0,0 -u 1,1,1,0.4,3,3,3,3 \
-e 0.0003,0.002,0.00001,0.000002,0.003,0.001 -n 100000 \
-s 50 \
-- ./lrgvForMOEAFramework -m std-io -b ${FILEBASE} \
-c combined -r 5000) &

# wait ensures that job doesn't exit until all background jobs have completed
 
wait
 
EOF
