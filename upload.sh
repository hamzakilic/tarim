#! /bin/sh

for file in  ./**
do
	if [ $file != "./http" ]; then
	nodemcu-uploader -p $1 upload  $(basename $file)
	fi
done

for file in  ./http/**
do
        if [ $file != "./http" ]; then
         nodemcu-uploader -p $1 upload "http/"$(basename $file)
        fi
done
