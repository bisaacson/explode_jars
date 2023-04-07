#!/bin/bash

# Set the path variable to control where the script runs
PATH_VAR="/path/to/java/application"

# Find all jar files and replace them with "exploded" files
for f in $(find $PATH_VAR -type f -name "*.jar"); do
    # Unzip the jar file into a directory with the same name with .tmp added
    unzip $f -d $f.tmp
    # Remove the original jar file
    rm -f $f
    # Remove the .tmp from the directory name
    mv $f.tmp $f
done
