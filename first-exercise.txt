You will be supplied with two data files in CSV format: "first-exercise-input-1.txt" and "first-exercise-input-2.txt". The first file contains statistics about various instances in AWS. The second file contains additional data.

Given the following formula:
 cost_benefit = (((MEMORY / m) + VCPU)/COST)
 Where m = 3.75 1/GiB (memory unit factor)

Write a program to read in the data files from disk, it must then print the names
of only the HVM instance types from a better cost benefit to the lowest. 
Do not print any other information.
