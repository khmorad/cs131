#!/bin/bash


# shell script created to cleanup date formats in any .csv file

# $# stores the number of argument so Im using if statement to check if the user
# has included the needed input for th eshell script to work
if [ $# -ne 1 ]; then
    echo "Usage: $0 <input_csv_file>"
    exit 1
fi

# Assign the first argument ($1) the file that needs to be cleaned
# to the variable input_file

input_file=$1

# Check if the input file exists if not use echo to display Error message
if [ ! -f "$input_file" ]; then
    echo "Error: Input file '$input_file' not found."
    exit 1
fi

# Define a temporary file for storing the modified data
temp_file="temp.csv"

# using sed command and regular expressions to 
# remove paranthesis and only include one year in one column
# Ex: (2006-2019) would get converted into 2006
# move the content to a temp file and prepare for the next sed operation
sed -E 's/[(]([0-9]+)[^0-9]*–*[0-9]*[)]/\1/g' "$input_file" > "$temp_file"

# this sed is more focused on removing hyphens from the year column for a more cleaner
# data
sed -i 's/-//g' "$temp_file"

# Rename the temporary file to the original file
mv "$temp_file" "$input_file"

echo "Date format fixed in '$input_file'."

