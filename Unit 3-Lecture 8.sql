/* Unit 3 - Lecture 8 */

/*----------------------------------------------------------------------------------------*/

/* Natural Join */
/* A Natural Join is similar to 
   Left, Inner, Right Join except that
   the joining key columns are identified 
   based on common column names between 
   the 2 tables */

# Syntax:
# SELECT * FROM <left table>
#	NATURAL <LEFT, RIGHT, INNER> JOIN <right table>;

# Natural Inner Join
SELECT * FROM `PMDA Marks`
	 NATURAL JOIN `PFA Marks`;

# Natural Left Join
SELECT * FROM `PMDA Marks`
	 NATURAL LEFT JOIN `PFA Marks`;


/*----------------------------------------------------------------------------------------*/

/* IN Operator */
/* The IN Operator allows the multiple 
   use of OR operator w.r.t a column condition */

# Syntax:
# SELECT * FROM <table name> WHERE <column name> IN (<values>);

# Example:
# From Sales table,
# Extract Orders where Quantity = 2, 3

# Using OR operator
SELECT * FROM Sales WHERE Quantity = 2 OR Quantity = 3;

# Using IN operator
SELECT * FROM Sales WHERE Quantity IN (2,3);


/*----------------------------------------------------------------------------------------*/
/* ALL Operator */

/* Checks if ALL or set of values matches 
   the row value */
   
# Example:
# Row Value:      Comparision
#    A051             A051
#                     A055
#                     A012
#                     A034

# Output?


/* Subquery */
/* A query within a query */

/* Problem To Demonstrate ALL Operator and Subquery */
/* 
A new databased created by HDFC Bank
had a few leakages which led to data leakages.

It's said that all deposits made via the new system
has a deposit ID starting with "5".

Get the Customer details whose
Deposit ID starts with "5", to send an alert. 
*/

SELECT * FROM `Customer Data` WHERE 
	`Account ID` IN
	(SELECT `ï»¿Account ID` FROM `Deposits Data` WHERE 
		`Deposit ID` LIKE "6%");

        
/*----------------------------------------------------------------------------------------*/        
/* Closing Comments */
/*
1.) Revision
2.) Use
3.) Mutliple columns forming a Primary Key
4.) Interview related questions
*/

/*----------------------------------------------------------------------------------------*/
