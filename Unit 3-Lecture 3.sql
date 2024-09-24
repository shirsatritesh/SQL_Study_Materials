/* Unit 3 - Lecture 3 */

/*----------------------------------------------------------------------------------------*/
/* Aggregating Data (Cont...) */

/* COUNT */
# Provides the Frequency of required instances

# Syntax:
# SELECT COUNT(<column name>) AS <temporary name> FROM <table name>;

SELECT COUNT(`Ship Mode`) AS Frequency_Ship_Mode FROM sales;


/* AVERAGE */
# Provides the Arithmetic mean of the numeric column

# Syntax:
# SELECT AVERAGE(<column name>) AS <temporary name> FROM <table name>;

SELECT AVG(`Profit`) AS Average_Profit FROM sales;


/* MIN & MAX */
# Provides the Min or Max of the given column

# Syntax:
# SELECT MIN(<column name>) AS <temporary name> FROM <table name>;
# SELECT MAX(<column name>) AS <temporary name> FROM <table name>;

SELECT MIN(`Profit`) AS Min_Profit FROM sales;
SELECT MAX(`Profit`) AS Max_Profit FROM sales;

# Combining All
SELECT  MIN(`Profit`) AS Min_Profit,
		AVG(`Profit`) AS Avg_Profit,
        MAX(`Profit`) AS Max_Profit,
        SUM(`Profit`) AS Total_Profit
        FROM sales;

/*----------------------------------------------------------------------------------------*/
/* Group By */

# Recall:
# Equivalent to Pivot Tables In Excel.
# Equivalent to group_by() and summarise() In R.

# Syntax:
# SELECT <summarise column / level> FROM <table name> GROUP BY <columns(s)>;

# Import the Cars.csv and answer the following questions:
# Q1.) What is the Average Mileage for each type of Cylinder?
# Q2.) What is the Maximum Horse Power for each type of Cylinder?
# Q3.) Is there any difference in Average Mileage for 
# 	   each type of Cylinder engine and type of gear?
# Q4.) Is there any difference in Average and Max Mileage for 
# 	   each type of Cylinder engine and type of gear?


/*----------------------------------------------------------------------------------------*/

# Exercise 
/*
You have just joined the Data Science Team of HDFC Bank. 
In a casual conversation, you're colleague mentions you that 
the Loan Default data table will no longer will be maintained 
by the IT Team due to lack of instant support.
Instead, this data table will now be under control by your team.

Later that day, you receive an email from your manager,
stating the following:

' 
Hi Tanish!,
We will now be responsible to maintain the Loan Default data table.
We have received the past data from IT. I request you to load the
same in our database with the name 'Credit Default' and ensure that
appropriate contraints are built up and required cleaning is made.

Also, if you can help me with the following questions from Sales team.
1.) What is the Average, Minimum and Maximum salary
    across the type of customers?
2.) List the top 10 ID with highest Debt Ratio?
3.) Do we see some relationship between Debt Ratio and Job type?
4.) What ages do we see defaulting the maximum?

'
*/