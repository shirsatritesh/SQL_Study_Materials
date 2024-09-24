/* Unit 3 - Lecture 2 */

/*----------------------------------------------------------------------------------------*/
/* ALTER / MODIFY / CHANGE the structure of the Table */

# Q - Reasons to Modify?

# Syntax:
# ALTER TABLE <table name> <actions>;

#--------------------------------------------------------

# 1st Action:
# Add Column

# Q - Why do we need to add column?
# Provide Systems development example

# Syntax:
# ALTER TABLE <table name> ADD <column name> <type>;

# The team wants to capture the delivery experince
# Let's add the Feedback column

ALTER TABLE sales ADD feedback_rating INT;

#--------------------------------------------------------

# 2nd Action:
# Drop Column

# Syntax:
# ALTER TABLE <table name> DROP <column name>;

# After 6 months, the team now plans to
# have a dedicated Feedback table.

# Hence, remove the feedback column addded
ALTER TABLE sales DROP feedback_rating;

# Q - Situation where we may want
# to eliminate a column?

#--------------------------------------------------------

# 3rd Action:
# Change Column Type

# Syntax:
# ALTER TABLE <table name> ALTER COLUMN 
# 	<column name> TYPE <new data type>;

# Say, the volume of Business have now grown
# and huge quantity of retail orders are been received

DESCRIBE sales;
ALTER TABLE sales MODIFY COLUMN quantity BIGINT;
DESCRIBE sales;

# Q - Why do we need to change column type?
# Provide Systems development exam

#--------------------------------------------------------

# 3rd Action:
# Change Column Name

# Syntax:
# ALTER TABLE <table name> RENAME COLUMN 
# 	<old column name> TO <new column name>;

ALTER TABLE sales RENAME COLUMN `Customer Id` TO Customer_ID;

#--------------------------------------------------------

# 4th Action:
# Change Constraints Of Columns

# Syntax:
# ALTER TABLE <table name> MODIFY
# 	<column name> <data type> NOT NULL;

UPDATE sales SET feedback_rating = 3 WHERE feedback_rating IS NULL;
ALTER TABLE sales MODIFY feedback_rating INT NOT NULL;


#--------------------------------------------------------

# 5th Action:
# Making A Column The Primary Key

# Syntax:
# ALTER TABLE <table name> ADD PRIMARY KEY <column name>;

ALTER TABLE sales ADD CONSTRAINT PRIMARY KEY (Profit);


/*----------------------------------------------------------------------------------------*/
/* Sorting In SQL */

# Keyword: ORDER BY

# Syntax:
# SELECT * FROM <table name> ORDER BY <column name(s)> [ASC, DESC];

SELECT * FROM sales ORDER BY profit DESC;

# Q - What is sorting is done as per
# 2 or more columns

/*----------------------------------------------------------------------------------------*/
/* Aggregating Data */

/* SUM */
# Provides the Total figures

# Syntax:
# SELECT SUM(<column name>) AS <temporary name> FROM <table name>;

SELECT SUM(profit) AS total_profits FROM sales;

# Note:
# Providing Alias Is Optional

# Q - What is Aliasing?
# Aliases are used to give a column in a table, 
# a temporary name

# Syntax:
# SELECT <column name> AS <temporary name> FROM <table name>;

# Q - Why do we need Aliasing?

# Q - Why not R if use .csv files?
