#!/bin/sh

for filename in `ls *.java`
do
    echo "========================================================="
    echo "Regression testing MJSIM.jar -b -f $filename"
    java -jar MJ.jar $filename 
    java -jar ../MJSIM.jar -b -f $filename.s &> t1
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
    echo "DONE with MJSIM.jar -b -f $filename"
    echo "========================================================="

done


