-- Create the objects table
CREATE TABLE Objects
(
  Object_ID NUMBER(10) PRIMARY KEY,
  Object_Name VARCHAR2(50) NOT NULL,
  Object_Type VARCHAR2(50) NOT NULL,
  Object_Value NUMBER(10) NOT NULL
);

-- Create the loans table
CREATE TABLE Loans
(
  Loan_ID NUMBER(10) PRIMARY KEY,
  Loan_Amount NUMBER(10) NOT NULL,
  Loan_Interest_Rate NUMBER(5,2) NOT NULL,
  Loan_Duration NUMBER(10) NOT NULL,
  Loan_Start_Date DATE NOT NULL,
  Loan_End_Date DATE NOT NULL,
  Loan_Status VARCHAR2(20) NOT NULL,
  Borrower_ID NUMBER(10) NOT NULL,
  CONSTRAINT FK_Loans_Clients FOREIGN KEY (Borrower_ID) REFERENCES Clients(Client_ID)
);

-- Create the operations table
CREATE TABLE Operations
(
  Operation_ID NUMBER(10) PRIMARY KEY,
  Operation_Type VARCHAR2(20) NOT NULL,
  Operation_Date DATE NOT NULL,
  Operation_Amount NUMBER(10) NOT NULL,
  Loan_ID NUMBER(10) NOT NULL,
  Account_ID NUMBER(10) NOT NULL,
  CONSTRAINT FK_Operations_Loans FOREIGN KEY (Loan_ID) REFERENCES Loans(Loan_ID),
  CONSTRAINT FK_Operations_Accounts FOREIGN KEY (Account_ID) REFERENCES Accounts(Account_ID)
);

-- Create the accounts table
CREATE TABLE Accounts
(
  Account_ID NUMBER(10) PRIMARY KEY,
  Account_Number NUMBER(20) NOT NULL,
  Account_Balance NUMBER(10) NOT NULL,
  Account_Type VARCHAR2(20) NOT NULL,
  Client_ID NUMBER(10) NOT NULL,
  CONSTRAINT FK_Accounts_Clients FOREIGN KEY (Client_ID) REFERENCES Clients(Client_ID)
);

-- Create the clients table
CREATE TABLE Clients
(
  Client_ID NUMBER(10) PRIMARY KEY,
  First_Name VARCHAR2(50) NOT NULL,
  Last_Name VARCHAR2(50) NOT NULL,
  Email VARCHAR2(50) NOT NULL,
  Phone_Number NUMBER(20) NOT NULL,
  Address VARCHAR2(200) NOT NULL,
  Date_of_Birth DATE NOT NULL,
  Client_Type VARCHAR2(20) NOT NULL
);

-- Create the users table
CREATE TABLE Users
(
  User_ID NUMBER(10) PRIMARY KEY,
  First_Name VARCHAR2(50) NOT NULL,
  Last_Name VARCHAR2(50) NOT NULL,
  Email VARCHAR2(50) NOT NULL,
  Phone_Number NUMBER(20) NOT NULL,
  Address VARCHAR
  VARCHAR2(200) NOT NULL,
  User_Name VARCHAR2(50) NOT NULL,
  Password VARCHAR2(50) NOT NULL,
  Role_ID NUMBER(10) NOT NULL,
  CONSTRAINT FK_Users_Roles FOREIGN KEY (Role_ID) REFERENCES Roles(Role_ID)
);

-- Create the roles table
CREATE TABLE Roles
(
  Role_ID NUMBER(10) PRIMARY KEY,
  Role_Name VARCHAR2(50) NOT NULL,
  Role_Description VARCHAR2(200) NOT NULL
);

-- Create index on Loans table for Borrower_ID column
CREATE INDEX IDX_Loans_Borrower_ID ON Loans (Borrower_ID);

-- Create index on Operations table for Loan_ID and Account_ID columns
CREATE INDEX IDX_Operations_Loan_ID_Account_ID ON Operations (Loan_ID, Account_ID);

-- Create index on Accounts table for Client_ID column
CREATE INDEX IDX_Accounts_Client_ID ON Accounts (Client_ID);

-- Create a user with the necessary privileges to access the tables
CREATE USER loan_app_user IDENTIFIED BY password;
GRANT CONNECT, RESOURCE TO loan_app_user;
GRANT SELECT, INSERT, UPDATE, DELETE ON Objects TO loan_app_user;
GRANT SELECT, INSERT, UPDATE, DELETE ON Loans TO loan_app_user;
GRANT SELECT, INSERT, UPDATE, DELETE ON Operations TO loan_app_user;
GRANT SELECT, INSERT, UPDATE, DELETE ON Accounts TO loan_app_user;
GRANT SELECT, INSERT, UPDATE, DELETE ON Clients TO loan_app_user;
GRANT SELECT, INSERT, UPDATE, DELETE ON Users TO loan_app_user;
GRANT SELECT, INSERT, UPDATE, DELETE ON Roles TO loan_app_user;
