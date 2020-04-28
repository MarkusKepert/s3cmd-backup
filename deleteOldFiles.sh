#!/bin/bash
#

function deleteFiles()
{
  timespan=$2
  # delete files in current dir
  s3cmd ls $1 | grep "DIR" -v | while read -r files;
  do
    createDate=`echo $files|awk {'print $1" "$2'}`
    createDate=`date -d"$createDate" +%s`
    olderThan=`date -d"-$timespan days" +%s`
    if [[ $createDate -lt $olderThan ]]
    then
       fileName=`echo $files|awk {'print $4'}`
       if [[ $fileName != "" ]]
       then
          printf 'Deleting "%s"\n' $fileName
          s3cmd del "$fileName"
       fi
    fi
  done;
}




function traverseDir()
{
  echo "delete files older than " $2" days in folder " $1
  timespan=$2
  deleteFiles $1 $timespan


  # traverse through subdirs
  s3cmd ls $1 | grep "DIR" - | while read -r subdirs;
  do
	  # echo $subdirs
	  sub=`echo $subdirs|awk {'print $2'}`
	  traverseDir $sub $timespan
  done;
}


traverseDir s3://$1 $2

#s3cmd ls s3://$1 | grep " DIR " -v | while read -r line;
#    do

#	    	echo $line
#    deleteFiles $line
    #createDate=`echo $line|awk {'print $1" "$2'}`
    
    ^
    #createDate=`date -j -f "%Y-%m-%d %H:%M" "$createDate" +%s`
    #olderThan=`date -j -v-$2 +%s`
    #if [[ $createDate -lt $olderThan ]]
    #then
    #   fileName=`echo $line|awk {'print $4'}`
    #   if [[ $fileName != "" ]]
    #   then
    #      printf 'Deleting "%s"\n' $fileName
    #      s3cmd del "$fileName"
    #   fi
    #fi
#  done;


