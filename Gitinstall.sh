#!/bin/bash

###############################################
# NAME: V.Thipapreddy
# DATE: 31-05-2024
# VERSION: 1.0.0
# This Script is used for downloading version control git into Liunx OS
# $?- Represents result count $# - Number of arguments of we are passing $(!!) - This command helps in reusing of previous command
# NAME=$1 and NAME="V.THIPPAREDDY" are the two ways of representing arguments
# Arrays are used to for multiple strings in the same variable syntax is FRUITS = (APPLE,MANGO,PINEAPPLE)
##################################################

function wget_Download {
    echo "Checking if wget is available or not"
    wget --version
    if [ $? -eq 0 ];
    then
        echo "Wget is already available"
    else
        if [ "$(grep -Ei 'centos|redhat' /etc/*-release)" ];
        then
            echo "Downloading Wget for Redhat package"
            sudo yum install wget -y
                if [ $? -eq 0 ];
                then
                    echo "Downloaded Wget package for Redhat OS"
                        if [ $? -eq 0];
                        then
                            echo "Downloading Git for redhat"
                            sudo yum install git
                                if [ $? -eq 0 ];
                                then 
                                    echo "git Downloaded Git successfully"
                                else
                                    echo "Unable to download Git"
                                    exit 1
                                fi
                else
                    echo "Unable to download Wget package for Redhat OS"
                    exit 1
                fi
        elif [ "$(grep -Ei 'debian|ubuntu|mint' /etc/*-release)" ] ;
        then
            echo "Downloading Wget for Ubuntu Package"
            sudo apt install wget -y
                if [ $? -eq 0 ];
                then
                    echo "Downloaded Wget package for Ubuntu OS"
                else
                    echo "Unable to download wget package for ubunut OS"
                    exit 1
                fi
        else
            echo "Unsupported OS"
            exit 1
        fi
    fi
}
wget_Download
