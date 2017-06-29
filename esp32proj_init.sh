#!/bin/bash

function print_usage {
    echo "esp32proj_init: Initialize simple ESP32 project with ESP-IDF"
    echo -e "\nUsage: esp32proj_init.sh [PROJECT_NAME]"
    echo -e "\n\n"
}

function cleanup {
    if [ -d $1 ];
    then
        rm -rf $1
    fi
}

TARGET_PATH=$1

if [ -z "$TARGET_PATH" ];
then
    print_usage
    exit 1
fi

if [ -d $TARGET_PATH ];
then
    echo "Project is already exist at $TARGET_PATH. Exiting"
    exit 0
fi

PROJECT_NAME=${TARGET_PATH##*/}
PROJECT_NAME_PLACEHOLDER="esp32proj"
TEMPLATE_DIR="template"
TEMPORARY_DIRNAME=$(dirname $TARGET_PATH)/esp32projtemp-$(date +%s)

cp $TEMPLATE_DIR $TEMPORARY_DIRNAME -r
if [ $? -ne 0 ];
then
    echo "Failed to create temporary directory."
    cleanup $TEMPORARY_DIRNAME
    exit 1
fi

if [ ! -f $TEMPORARY_DIRNAME/Makefile ];
then
    echo "No Makefile found! Exiting"
    cleanup $TEMPORARY_DIRNAME
    exit 1
fi

sed -i "s/$PROJECT_NAME_PLACEHOLDER/$PROJECT_NAME/" $TEMPORARY_DIRNAME/Makefile

if [ ! -f $TEMPORARY_DIRNAME/main/$PROJECT_NAME_PLACEHOLDER.cpp ];
then
    echo "No main cpp file found! Exiting"
    cleanup $TEMPORARY_DIRNAME
    exit 1
fi

mv $TEMPORARY_DIRNAME/main/$PROJECT_NAME_PLACEHOLDER.cpp $TEMPORARY_DIRNAME/main/$PROJECT_NAME.cpp

mv $TEMPORARY_DIRNAME $TARGET_PATH

echo "Initialized project at $TARGET_PATH"