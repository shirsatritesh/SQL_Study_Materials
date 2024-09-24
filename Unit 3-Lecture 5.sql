/* Unit 3 - Lecture 5 */

/*----------------------------------------------------------------------------------------*/
/* Joins */

/* In practise, often different departments
  handle / store different information.
  We wish to combine all these information
  into one single dataset.

  Joins help us achieve this objective.


# Concepts to be known:
  Primary Key
  Foriegn Key


# Types of Joins:
  1.) Left Join
	   Returns all rows from the left table, 
       and the matching rows from the right table.
       Here matching is based on the Key.
       
  2.) Right Join
	   Returns all rows from the right table, 
       and the matching rows from the left table.
       Here matching is based on the Key.

  3.) Inner Join 
  	   Returns all the rows whenever there are 
       matching values in a field common to both tables.

  4.) Cross Join
      Returns the Cartesian product of rows from the tables.
      
  5.) Full Join
      Returns unmatched rows from both tables as 
      well as the overlap between them.


# Syntax For LEFT JOIN:
SELECT * FROM <left table>
	LEFT JOIN <right table> ON 
		<Left Table Key> = <Right Table Key>;

# Syntax For RIGHT JOIN:
SELECT * FROM <left table>
	RIGHT JOIN <right table> ON 
		<Left Table Key> = <Right Table Key>;

# Syntax For CROSS JOIN:
SELECT * FROM <left table>
	CROSS JOIN <right table>;


# Problem 
 /*
You are given 3 data tables of HDFC Bank.
1.) Customer Base
2.) Transaction Base
3.) Deposits Base

Draw out a link between all the 3 tables.

*/


/* Import the data for PFA Marks, SMA Marks, PMDA Marks, MSI Marks
   and answer the following:
*/
   
# Application of Left / Right Join
# Q1.
# Create a final table containing marks for 
# PMDA and SMA given that all students were present 
# for PMDA.

SELECT * FROM `PMDA Marks` AS PMDA
	LEFT JOIN `SMA Marks` AS SMA
		USING (Roll_No);


# Application of Inner Join
# Q2.
# Create a final table containing marks for 
# students who were present for all the exams.

SELECT * FROM `PMDA Marks` AS PMDA
	INNER JOIN `SMA Marks` AS SMA
	USING (Roll_No);


SELECT * FROM `PMDA Marks` AS PMDA
	INNER JOIN `SMA Marks` AS SMA
	USING (Roll_No)
		INNER JOIN `PFA Marks`
		USING (Roll_No)
			INNER JOIN `MSI Marks`
            USING (Roll_No);


# Application of Full Join
# Q3.
# Create a table containing marks for 
# PMDA and PFA subjects.

SELECT * FROM `PFA Marks` AS PFA
	LEFT JOIN `PMDA Marks` AS PMDA
	USING (Roll_No)
    WHERE PMDA.Roll_No IS NULL
UNION
SELECT PMDA.Roll_No, PFA.PFA_Marks, PMDA.PMDA_Marks 
	FROM `PMDA Marks` AS PMDA
	LEFT JOIN `PFA Marks` AS PFA
	USING (Roll_No) 
ORDER BY Roll_No;



# Application of Cross Join
CREATE TABLE CJOne (
	Product CHAR(1));

CREATE TABLE CJTwo (
	City CHAR(10));

INSERT INTO CJOne VALUES
	("A"),
    ("B"),
    ("C");
    
INSERT INTO CJTwo VALUES
	("Mumbai"),
    ("Delhi"),
    ("Chennai");
    
SELECT * FROM CJOne 
 CROSS JOIN CJTwo;
 