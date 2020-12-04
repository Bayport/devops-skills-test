#!/bin/bash

################################################################################
#                              listit.sh                                       #
#                                                                              #
# Author:   Basil Dlamini                                                      #
# Date:     02/12/2020                                                         #
# Description:                                                                 #
#       In response to Bayport DevOps skills test, this script aims to fulfil  #
#           the development requirements specified.                            #
#                                                                              #
################################################################################


# Help                                                                         #
################################################################################
Help()
{
    # Display Help Message
    echo 
    echo "This script is designed to do the following in order..."
    echo 
    echo "1. Create a file called directories.list that contains the directory names only of the current directory."
    echo "2. Add a line at the beginning of the directories.list file that reads \"line one's line\"."
    echo "3. Output the first three lines of directories.list on the console."
    echo "4. Accept an integer parameter when executed and repeat the previous steps's output x amount of times based on the parameter provided at execution."
    echo
    echo "Syntax: listit.sh [x | -h | --help] "
    echo "constraints:"
    echo "x must be a positive integer"
    echo
}


# Main program                                                                 #
################################################################################

ls -d */ > directories.list
sed -i "1s/^/line one's line\n/" directories.list
head -3 directories.list

if [ $# -gt 1 ]; then
    if [[ $1 == '-h' ] | [$1 == '--help']]; then
        Help()
        exit 0
    fi
    re='^[0-9]+$'
    if ! [[ $1 =~ $re ]] ; then
        echo "Not a valid argument please use -h for more options." 
        exit 0
    fi
    i=$1
    until [$i -le 0]
    do
        sed -i "1s/^/line one's line\n/" directories.list
        ((i=i-1))
    done
fi