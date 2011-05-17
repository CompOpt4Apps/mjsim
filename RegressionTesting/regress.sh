#!/bin/sh
#
# Regression testing for MJSIM.jar.
# Given .java files and corresponding .s files and possibly
# .arg_opts files, this script checks that the simulator produces
# the same input as the Java only version of MeggyJava programs.
#
# usage examples: 
#   ./regress.sh


for filename in `ls *.java`
do
    echo "========================================================="
    echo "Regression testing ../MJSIM.jar -b -f $filename.s"
    
    # check if there is an arg_opts file to go with it
    # and copy that into meggy/arg_opts
    if test -f $filename.arg_opts 
    then
        cp -f $filename.arg_opts meggy/arg_opts
    fi
    
    # run the simulator on the generated .s file
    java -jar ../MJSIM.jar -b -f $filename.s &> t1
    
    # remove any previous versions of the file
    rm *.class t2  > /dev/null 2>&1
    # Run the java only version of the program.
    javac $filename >& t2
    if [ $? -eq 0 ] 
    then
        class=`basename $filename .java`
        # run java on Java bytecode
        java $class &> t2
    fi
    diff t1 t2
    echo "DONE with ../MJSIM.jar -b -f $filename.s"
    echo "========================================================="

done


