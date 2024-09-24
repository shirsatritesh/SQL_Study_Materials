/* Unit 3 - Lecture 4 */

/*----------------------------------------------------------------------------------------*/
/* Use Of HAVING Clause */

# HAVING Clause is used to filter
# aggregate data, which is returned
# primarily after using the GROUP BY Clause

# Syntax:
# SELECT <summarise column / level> FROM <table name> 
# 		GROUP BY <columns(s)> HAVING <condition(s)>;

# Example:
# From the Sales table, provide the Customers whose
# account needs to be deactivated.

SELECT `Customer ID`, SUM(Profit) AS Total_Profits 
	FROM sales GROUP BY `Customer ID` 
		HAVING Total_Profits < 0;

# Q - Why NOT use the "WHERE" Clause?

# Now, the company decide that Customers belonging
# to Standard class cannot be discountinued 
# due to their Prime membership.

# Revise your code based on the above information.

SELECT `Customer ID`, SUM(Profit) AS Total_Profits 
	FROM sales WHERE `Ship Mode` = "Second Class" 
		GROUP BY `Customer ID` 
			HAVING Total_Profits < 0;

    
/*----------------------------------------------------------------------------------------*/
/* Numeric Functions */

# 1.
# CEIL
# Returns the smallest integer value that is >= to a no.

# FLOOR
# Returns the largest integer value that is <= to a no.

# Q - Situation where CEIL / FLOOR is to be used?

# Find out Profits at a Customer Level
# without nos. being immaterial.

SELECT `Customer ID`, CEIL(SUM(Profit)) AS Total_Profits 
	FROM sales GROUP BY `Customer ID` 
		HAVING Total_Profits < 0;


SELECT `Customer ID`, FLOOR(SUM(Profit)) AS Total_Profits 
	FROM sales GROUP BY `Customer ID` 
		HAVING Total_Profits < 0;

 

# 2.
# ROUND
# Truncates a number to certain no. of decimals

# Example:
# Taking the first example in the script to
# rounf off the losses.

# Maintaining Precision upto a required level.
# For eg. Marks.

SELECT `Customer ID`, ROUND(SUM(Profit),2) AS Total_Profits 
	FROM sales GROUP BY `Customer ID` 
		HAVING Total_Profits < 0;

# Q - Situation where ROUND is to be used?



# 4.
# ABS() 
# Absolute value of a no.

# Refer to the Data used in Date Functions.

# Due a glitch, 
# some Order dates have swaped with Delivery dates

SELECT ABS(TIMESTAMPDIFF(DAY,CURRENT_DATE,"2023-02-01")) AS GAP;

# Q - Situation where ABS can be used?


# Other Numeric Function:
# SUM, MIN, MAX, COUNT, LOG, RAND


/*----------------------------------------------------------------------------------------*/
/* String Functions */

# 1.
# LENGTH()
# Returns the length of a string

SELECT LENGTH(`Customer ID`) FROM sales;

# Q - State one problem where length function can be used?



# 2.
# UPPER() 
# Converts a string to upper case

# LOWER()
# Converts a string to lower case

SELECT DISTINCT UPPER(`Ship Mode`) FROM sales;

# Q - Voter's ID Form Example
# Q - Use of UPPER / LOWER?



# 3.
# REPLACE()
# Replaces the occurrences of a pattern within a string, 
# with a new substring

SELECT REPLACE(`Ship Mode`,"STANDARD CLASS","Prime Users") FROM sales;

# Note:
# The REPLACE() is CASE SENSITIVE


# Check for the Statement above:

SELECT `Customer ID`, SUM(Profit) AS Total_Profits 
	FROM sales WHERE `Ship Mode` = "SECOND CLASS" GROUP BY `Customer ID`;



# 4.
# TRIM()
# Removes leading and trailing spaces from a string

SELECT TRIM("WHATSAPP TEXT ") AS TEST_CUT;

# Q - What's App Example



# 5.
# CONCAT()
# Adds two or more expressions strings into one element
# Alternatvely, Concatenation

SELECT CONCAT(`Order ID`,`Customer ID`) AS Unique_Key FROM sales;



# 6.
# SUBSTRING()
# Extracts a part of the string given the start and end points

SELECT DISTINCT SUBSTRING(`Order ID`,1,2) FROM sales;



/*----------------------------------------------------------------------------------------*/
/* Date Functions */

# 1.
# CURRENT_DATE
# Returns the current date

INSERT INTO sales (
	`Order Date`,Feedback_Rating) 
		VALUES (CURRENT_DATE,3);
        
SELECT CURRENT_TIME;
SELECT CURRENT_TIMESTAMP;



# 2.
# TIMESTAMPDIFF()
# Returns the difference between two dates.

SELECT TIMESTAMPDIFF(YEAR,"1999-06-01",CURRENT_DATE) AS Age;

# Note:
# Go back to ABS function to solve the questions.


# 3.
# STR_TO_DATE()
# Convert String To Date

SELECT STR_TO_DATE("1999-06-01", "%Y-%m-%d") AS Date_Convert;

# Formatting:
# %b	Abbreviated month name (Jan to Dec)
# %m	Month name as a numeric value (01 to 12)
# %Y	Year as a numeric, 4-digit value
# %y	Year as a numeric, 2-digit value
# %d	Day of the month as a numeric value (01 to 31)


/*----------------------------------------------------------------------------------------*/
# Exercise 
/*
You work as a Senior Data Scientist at Cars24.Com,
whose reporting is directly to the Chief Data Officer (CDO)
of the organization.

There has been a urgent requirement from the Business Team
and they have asked the Data Science team to answer 
# the following questions:

Q1.) Recently, we see rise in complaints from consumers that they are
     not willing to pay more for older vehicles as they are driven more.
     Is this true?

Q2.) State the relationship between Age of the Vehicle and Kms driven?
     If at all there is a relationship, what will be your
     recommendation to the team?

Q3.) TATA is the best selling Manufacturer currently.
	 How is much is the stock for each of the Manufacturer?

Q4.) Is there any difference in car usage based on Fuel type?
     If yes, should we purchase only the vehicles that are lesser used?

Q5.) What is the Selling price of vehicles of different fuel type 
     across India?

Q6.) Alto v/s i10, which Model has a higher stock in the garage?

The CDO is out of office and hence you are on your own
to solve the problem.
Prepare your solution draft which will be represented
to CDO once he's back.

*/
