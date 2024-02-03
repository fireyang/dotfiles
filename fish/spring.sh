#!/bin/bash
function uao(){
  file_name=$1
  unzip $file_name
  echo "filename: ${file_name%.*}"
  dir_name=${file_name%.*}
  # idea $dir_name/pom.xml
  open -a "IntelliJ IDEA CE.app" $dir_name/pom.xml
}
