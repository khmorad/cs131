# A4 (.csv data cleaner)

## Issue

The original CSV file contained many date entries in various formats, such as "(2019)", "(2006–2013)", and "(2021– )" that needed to be cleaned. I this case I have created a shell script as a way to standardize the mentioned formats to a four-digit year representation without parentheses or hyphens as a way to make the contends in the csv file more consistent.

## Solution

The solution involved writing a shell script that utilized the `sed` command. The script performs the following steps:

1. Checks if the correct number of arguments are provided.
2. Assigns the input file to a variable and checks if it exists.
3. Defines a temporary file for storing the modified data.
4. Removes parentheses from the 'YEAR' column using `sed` with a regular expression.
5. Removes any hyphens from the 'YEAR' column.
6. Renames the temporary file to the original file.

## Usage

1. Place the CSV file with movie data in the same directory as the script.
2. Run the script by executing `./fix_dates.sh movies.csv`.

The modified CSV file will have the date format fixed, and the original file will be backed up with the extension `.bak`.

for safety purposes please note that this script assumes the CSV file has a 'YEAR' column, and it is important to have a backup of the original data before running this script since this scrip tends to edit the original file directlly.
