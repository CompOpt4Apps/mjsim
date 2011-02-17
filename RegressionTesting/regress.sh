#!/bin/sh

for filename in `ls *.java`
do
    echo "========================================================="
    echo "Regression testing MJ.jar --two-pass-interpret $filename"
    java -jar ../MJ.jar --two-pass-interpret $filename &> t1
    # remove any previous versions of the file
    rm *.class t2  > /dev/null 2>&1
    javac $filename >& t2
    if [ $? -eq 0 ] 
    then
        class=`basename $filename .java`
        # run java on Java bytecode
        java $class &> t2
    fi
    diff t1 t2
    echo "DONE with MJ.jar --two-pass-interpret $filename"
    echo "========================================================="

    echo "========================================================="
    echo "Regression testing MJ.jar --two-pass-mips $filename"
    rm $filename.s > /dev/null 2>&1
    java -jar ../MJ.jar --two-pass-mips $filename >& t
    if [ -f $filename.s ]
    then
        java -jar Mars.jar nc $filename.s >> t
    fi
    diff -B t t2
    echo "DONE with MJ.jar --two-pass-mips $filename"
    echo "========================================================="

done


