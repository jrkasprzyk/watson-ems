readme.txt

Note: To run this project you also need the LRGV model (see the GitHub of jrkasprzyk), as well as a copy of the Borg MOEA (go to http://www.borgmoea.org/)

Scen1.sh - Example shell script used to execute scenario runs under baseline conditions

format_optfiles_for_eval-script.sh - Shell script used to format the results from the optimization runs to put them directly into the LRGV code

evaluation-scrip.sh - Shell script used to do the re-evaluations where the control files designate the conditions of the LRGV code and the solutions are from all five scenario optimizations 

control files - used to designate both conditions of optimization and conditions of evaluation for lrgv code

paper_phase2_2dplots.m and paper_phase2_parallelplots.m - these are the codes for weeding out constraint violation solutions and plotting
