#!/bin/bash

# Set the path variable to control where the script runs
PATH_VAR="/path/to/java/application"

# Find all jar files and replace them with "exploded" files
for f in $(find $PATH_VAR -type f -name "*.jar"); do
    # Unzip the jar file into a directory with the same name but without the .jar extension
    unzip $f -d ${f/.jar/}
    # Remove the original jar file
    rm -f $f
done
