-- Load data into the Clients table from CSV file
LOAD DATA
INFILE 'clients.csv'
INTO TABLE Clients
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
(Client_ID, First_Name, Last_Name, Address, Phone_Number)

-- Load data into the Accounts table from CSV file
LOAD DATA
INFILE 'accounts.csv'
INTO TABLE Accounts
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
(Account_ID, Client_ID, Account_Number, Balance)

-- Load data into the Loans table from CSV file
LOAD DATA
INFILE 'loans.csv'
INTO TABLE Loans
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
(Loan_ID, Loan_Number, Loan_Amount, Borrower_ID, Loan_Start_Date, Loan_End_Date)

-- Load data into the Operations table from CSV file
LOAD DATA
INFILE 'operations.csv'
INTO TABLE Operations
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
(Operation_ID, Account_ID, Loan_ID, Operation_Date, Operation_Amount)

-- Load data into the Users table from CSV file
LOAD DATA
INFILE 'users.csv'
INTO TABLE Users
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
(User_ID, User_Name, Password, Role_ID)
