#!/bin/bash
#

function deleteFiles()
{
  name=$2
  bucket=$1
  # delete files in current dir
  s3cmd ls $bucket | grep "DIR" -v | while read -r files;
  do
       fileName=`echo $files|awk {'print $4'}`
       if [[ $fileName = $bucket$name ]]
       then
          printf 'Deleting "%s"\n' $fileName
          s3cmd del "$fileName"
       fi
  done;
}




function traverseDir()
{
  echo "delete file with name " $2" from folder " $1
  name=$2
  deleteFiles $1 $name


  # traverse through subdirs
  s3cmd ls $1 | grep "DIR" - | while read -r subdirs;
  do
	  # echo $subdirs
	  sub=`echo $subdirs|awk {'print $2'}`
	  traverseDir $sub $name
  done;
}


traverseDir s3://$1 $2

