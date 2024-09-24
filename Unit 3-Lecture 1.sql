/* Unit 3 - Lecture 1 */

/*----------------------------------------------------------------------------------------*/
/* Quick Revision */
# Flow of data?
# What is SQL?
# Why SQL?
# What is MySQL?
# Types of Databases?
/*----------------------------------------------------------------------------------------*/

# To comment in script use
# For Single line commenting, use #
# For Multi line commenting, use /* <Comment> */

/*----------------------------------------------------------------------------------------*/

/* SQL Syntax Is NOT Case Sensitive */
/* Case Sensitive Meaning? */

/*----------------------------------------------------------------------------------------*/

/* Data Types */
/* Numeric Data Types */

# SMALLINT (-32,768 to 32,767)
# INTEGER (-2,14,74,83,648 to 2,14,74,83,647)
# BIGINT (-92,23,37,20,36,85,47,75,808 to 92,23,37,20,36,85,47,75,807)
# DECIMAL (Upto 131072 digits before decimal and upto 16383 after decimals)
# NUMERIC (Upto 131072 digits before decimal and upto 16383 after decimals)
# DOUBLE PRECISION (15 decimal digits precision)


# Q - Why do we need so many sub types?


/* Character Data Types */
#### CHARACTER VARYING(n), 
#    VARCHAR(n) [Variable length with limit] ####

# A VARIABLE length string (can contain letters, 
# numbers, and special characters). 
# The size parameter specifies the maximum 
# column length in characters - can be from 0 to 65535


#### CHARACTER(n), CHAR(n) ####
# [Fixed length with blanks added, maximum upto 255]


#### TEXT ####
# [Variable unlimited length, 
#  Holds a string with a maximum length of 65,535 bytes]


# Q - Why do we need so many sub types?


/* Boolean Data Types */
#### BOOLEAN ####
# [Zero is considered as FALSE, 
#  nonzero values are considered as TRUE]


/* Date Data Type */
# DATETIME (YYYY-MM-DD HH:MM:SS)
# DATE (YYYY-MM-DD)

/*----------------------------------------------------------------------------------------*/

/* Creating a Schema */
# Syntax:
# CREATE DATABASE <database name>;

CREATE DATABASE Classwork;


/* Creating a Table */
# Syntax:
# CREATE TABLE <table name> (
#    <column1> <datatype>,
#    <column1> <datatype>,
#    <column1> <datatype>,
#    ...
#    <columnn> <datatype>)

CREATE TABLE classwork.placements (
	sap_id CHAR(10),
    roll_no CHAR(4),
    student_name CHARACTER VARYING(50),
    past_exp SMALLINT,
    cgpa NUMERIC(4,2));

/*----------------------------------------------------------------------------------------*/
/* Insert Data in Table */

# After creating a table,
# the overall framework is ready which
# can hold the data now.

# Syntax:
# INSERT INTO <database name> . <table name> (
# <column 1>, <column 2>, ...) VALUES
# (<value 1>, <value 2>, ...)


# Adding as per Column names
INSERT INTO classwork.placements (cgpa, 
	student_name) VALUES 
    	(8.90,"Rakesh");


# Adding all values for one row
INSERT INTO classwork.placements VALUES 
    	("0291019291","A111","Rakesh",0,8.90);
        
        
# Adding all values for multiple row
INSERT INTO classwork.placements VALUES 
    	("0291019291","A111","RAKES",0,8.90),
    	("0211019291","A112","Suraj",1,7.90),
    	("028219291","A113","Priya",2,8.20),
    	("0721019291","A114","Santosh",0,5.90);


# Q - Recording of entries via Google Form
        
        
/* Deleting a Table */
# Syntax:
# DROP TABLE <data base> . <table name>;

DROP TABLE classwork.placements;


/* Deleting a Database */
# Syntax:
# DROP TABLE <data base> . <table name>;

DROP DATABASE classwork;

/*----------------------------------------------------------------------------------------*/

/* Adding Restrictions or Constraints while 
   creating a Table */

# PRIMARY KEY
# UNIQUE
# NOT NULL
# DEFAULT
# CHECK

CREATE TABLE classwork.placements (
	sap_id CHAR(10) PRIMARY KEY,
    roll_no CHAR(4) UNIQUE,
    student_name VARCHAR(50) NOT NULL,
    past_exp SMALLINT DEFAULT 0 CHECK (past_exp >= 0),
    cgpa NUMERIC(4,2));

# Q - Why do we need constraints?
# Q - Are they of any help?
# Q - Map it to Google Form.

/*----------------------------------------------------------------------------------------*/

/* Import data from .csv */
# Method 1:
# Using 'Data Import'


# Method 2:
# Using 'LOAD DATA'
CREATE TABLE classwork.TestImport(
	A DECIMAL(5,4),
    B DECIMAL(5,4),
    C DECIMAL(5,4),
    D DECIMAL(5,4));


SHOW VARIABLES LIKE "secure_file_priv";

LOAD DATA 
	INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Test Import.csv" 
		INTO TABLE classwork.TestImport FIELDS TERMINATED BY ',' 
			IGNORE 1 ROWS;


/*----------------------------------------------------------------------------------------*/
/* SELECT Statement */
# Use: The SELECT statement forms the basis
#      of the code to extract any part / whole of 
#      the data.

# Syntax:
# SELECT <column name(s)> FROM <data base> . <table name>;

# To extract entire data
SELECT * FROM DATA;

# Here, * indicates all
# rows and all columns.

# To extract selected column from the data
SELECT `Order ID`, `Ship Mode` FROM sales;

# To extract limited rows
SELECT * FROM DATA LIMIT 5;

/*----------------------------------------------------------------------------------------*/

/* Extracting Unique Records */
# Keyword: DISTINCT

# Syntax:
# SELECT DISTINCT <column 1>, <column 2>, ... FROM sales;

SELECT DISTINCT `Ship Mode`, Quantity FROM sales;

# Q - What output can be expected for 
# 2 or more variables above?

/*----------------------------------------------------------------------------------------*/
/* Filtering Data */
# To extract data which satisfies the given condition(s)
# Keyword: WHERE

# Syntax:
# SELECT * FROM sales WHERE <condition(s)>;

# Single Condition
SELECT * FROM sales WHERE `Ship Mode` = 'Second Class';


# Multiple Condition
SELECT * FROM sales WHERE `Ship Mode` = 'Second Class' AND Quantity >= 3;

# Recall:
# Logical operators: AND, OR, NOT


/*----------------------------------------------------------------------------------------*/
/* Delete Row Items Based On Coniditon */
# Keyword: DELETE

# Syntax:
# DELETE FROM <table name> WHERE <condition(s)>;

DELETE FROM sales WHERE PROFIT < 0;


/*----------------------------------------------------------------------------------------*/
/* Update Row Items Based On Coniditon */
# Keyword: UPDATE

# Syntax:
# UPDATE <table name> SET <value to replace> WHERE <condition>;

UPDATE sales SET Profit = 0 WHERE Quantity <= 1;

# Q - Examples of Update In Real World


/*----------------------------------------------------------------------------------------*/
/* Extract The First 'n' Rows */

# Recall:
# Equivalent to head() In R

# Syntax:
# SELECT * FROM <table name> LIMIT <no.>;



/*----------------------------------------------------------------------------------------*/
# Exercise 
/*
Ola.com, which is a startup company and just about to 
launch their Cab services in India in the upcoming months.

They want to create a database named 'OlaLake' which will contain
all required data for their day to day operations.

One of the key tables they want to create, is of the 
Vehicle itself (Named: 'OlaVehicles') which will be shared 
with the Customer(s) and validated on PARIVAHAN.

You have been hired as a Data Lake Engineer and 
asked for the following...`

*/
# Q1.) Create the schema and table for the team.
# Q2.) Highlight atleast 5 reasons for the columns 
#      which you have added?
# Q3.) Highlight atleast 5 constraints for the columns 
#      which you have added? Why?
# Q4.) Insert 10 row items into the data table.
# Q5.) Display the rows where Driver's age is less than
#      30 years.

/*----------------------------------------------------------------------------------------*/
