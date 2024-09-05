The script file 4-Bin.sh file can be run after changing the input value inside.
It run the fortran sourcecode 4-Bin.f to bin the sorted data into respective bins.
Detailed instructions are inside the file 4-Bin.f.

To run:
Step 1. Open 4-Bin.sh and modify the input file name [Here, set to 01-04-sorted.dat].
        The code is writen to account for the specific format and length of name here.

Step 2. Assign fortran compiler [set to ifort, can be changed to desired ones]

Step 3. Assign executable permission to 4-Bin.sh by running 'chmod 755 4-Bin.sh' 
        or chmod u+x 4-Bin.sh. 

Steo 4. Use ./4-Bin.sh to run the script. This will print the entire input file at the 
        end and will keep printing the bin numbers which were found in selection process.  
