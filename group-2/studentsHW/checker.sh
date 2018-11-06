#!/bin/bash

minDir=1
time=`date`

while read LINE
do
    link=`echo $LINE`
    git clone $link
    studentName=`ls | grep -v "checker.sh"`
    cd $studentName

    numberTasks=`ls -l | grep "Task" | wc -l`
    if [ $numberTasks -lt $minDir ];then
        echo IN CHECKER FILES
        echo "$studentName" " Not all tasks " "$time" >> ../../fail.txt
        cd ..
        rm -rf $studentName
        echo "Check continue!!!"
        continue
    fi

    cd Task1
    printf "%s" "param" > input_word.txt
    cat input_word.txt
    gcc -o Main1.elf Main1.c
    ls
    failedTasks=""
    ./Main1.elf
    if [ "$?" != "0" ];then
        echo RETURN NOT NULL
        failedTasks=`echo "$failedTasks task1:fail"`
    else
        echo RETURN NULL
        result=`cat output_word.txt`
    
        if [ "$result" != "marap" ];then
            echo FALSEEEEEEEEEE
            failedTasks=`echo "$failedTasks task1:fail"`
        fi
    fi

    cd ..
    #some tasks
    echo FAILED TASKS
    echo $failedTasks
    if [ "$failedTasks" != "" ];then
        echo NOT EMPTY FAILED
        echo "$studentName $failedTasks $time" >> ../../fail.txt
    else
        echo EMPTY FAILED
        echo "$studentName passed $time" >> ../../passHW.txt
    fi

    cd ..
    rm -rf $studentName

done < ../links.txt



#Its for push files(passHW.txt and fail.txt) to git repository. Student can check it.

#git commit -m "check $time"
#git push origin master
