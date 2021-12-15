#!/bin/bash

#echo "Insert /path/to/file 1 & 2 for the script to match"

PrivateKey=$1
PublicKey=$2

if [ -z "$1" ]
then
        echo "Please specify Private key file"
        exit
fi

if [ -z "$2" ]
then
        echo "Please specify the Public key file"
        exit
fi

PrivKey=$(openssl pkey -in $1 -pubout -outform pem | sha256sum)

PubKey=$(openssl x509 -in $2 -pubkey -noout -outform pem | sha256sum)

if [ "$PrivKey" == "$PubKey" ]
then
        echo "values match, all is good"
        else
        echo "Values do not match, please rectify and try again"
fi
