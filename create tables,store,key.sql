CREATE DATABASE AlbayanLibrary;
GO
USE AlbayanLibrary;
GO

/*******setting encryption*****/
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Admin'; 

CREATE CERTIFICATE Mycert WITH SUBJECT = ' My Certificate';   
GO  

CREATE SYMMETRIC KEY Mysymmkey WITH   
    ALGORITHM = AES_256 
    ENCRYPTION BY CERTIFICATE Mycert 
GO 

OPEN SYMMETRIC KEY Mysymmkey  
    DECRYPTION BY CERTIFICATE Mycert;   
GO  

CREATE TABLE PERSON(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
	Gender VARCHAR(1) check (Gender in('M','F')) NOT NULL,
	BirthDate DATE CHECK (BirthDate <= GETDATE()) NOT NULL,
	Email VARCHAR(50) check (Email like '%@%.%') NOT NULL UNIQUE,
	ContactNumber VARCHAR(20) NOT NULL UNIQUE,
	Address VARCHAR(100),
	Password VARBINARY(1000),
);



CREATE TABLE Staff (
    StaffID INT IDENTITY(1,1) PRIMARY KEY,
    Position VARCHAR(50) NOT NULL,
    BranchID INT FOREIGN KEY REFERENCES Branch(BranchID) NOT NULL,
    Salary money check (Salary>=1880 and Salary<100000) NOT NULL,
    ContractStartDate Date NOT NULL,
	ContractEndDate Date NOT NULL,
	CHECK (ContractStartDate<=GETDATE()),
	PersonId INT FOREIGN KEY REFERENCES Person(ID) UNIQUE,
	
);

NOT NULL;

CREATE TABLE Shifts(
	 StaffID INT NOT NULL,
	 Day Varchar(15) CHECK (Day IN('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday','Sunday')) NOT NULL,
	 StartTime TIME NOT NULL,
	 EndTime TIME NOT NULL
	 FOREIGN KEY (StaffID) REFERENCES Staff (StaffID),
);
CREATE TABLE Leavings(
	Reason varchar(50) NOT NULL,
	StaffID INT NOT NULL,
	LeavingDay Date NOT NULL
	FOREIGN KEY (StaffID) REFERENCES Staff (StaffID),
	CHECK (LeavingDay<=getDate())
)

CREATE TABLE Branch (
    BranchID INT PRIMARY KEY,
    Location VARCHAR(50) UNIQUE CHECK(Location IN ('Dubai', 'Ramallah', 'Amman')) NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL,
    BranchAddress VARCHAR(250) NOT NULL,
    OpenTime TIME NOT NULL,
    CloseTime TIME NOT NULL,
    CONSTRAINT UQ_Branch_Location UNIQUE (Location),
);




CREATE TABLE BranchManager (
    ManagerID INT IDENTITY(1,1) PRIMARY KEY,
    StaffID INT NOT NULL UNIQUE,
    BranchID INT CHECK (BranchID IN (1, 2, 3)) NOT NULL,
    FOREIGN KEY (StaffID) REFERENCES Staff (StaffID),
    FOREIGN KEY (BranchID) REFERENCES Branch (BranchID)
);


CREATE TABLE Supervisor (
    SupervisorID INT IDENTITY(1,1) PRIMARY KEY,
    StaffID INT NOT NULL UNIQUE,
    BranchID INT check (BranchID in(1,2,3)) NOT NULL,
    FOREIGN KEY (StaffID) REFERENCES Staff (StaffID),
    FOREIGN KEY (BranchID) REFERENCES Branch (BranchID)
);

CREATE TABLE StaffSupervisor(
	StaffID INT NOT NULL,
	SupervisorID INT NOT NULL,
	FOREIGN KEY (StaffID) REFERENCES Staff (StaffID),
	FOREIGN KEY (SupervisorID) REFERENCES Supervisor (SupervisorID),
);
CREATE TABLE Book (
    ISBN VARCHAR(20) PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Author VARCHAR(100) NOT NULL,
    PublicationYear INT NOT NULL,
    Category VARCHAR(50),
	Rating money CHECK (Rating>=1.0 and Rating<=5.0),
	NumOfRatings INT default  0
);

CREATE TABLE BookCopy (
    BookCopyID INT IDENTITY(1,1) PRIMARY KEY,
    ISBN VARCHAR(20) NOT NULL,
	Stat VARCHAR(20) CHECK (Stat in ('Available', 'Reserved', 'Checked-out')) NOT NULL,
    BranchID INT check (BranchID in(1,2,3)) NOT NULL,
    FOREIGN KEY (ISBN) REFERENCES Book (ISBN),
    FOREIGN KEY (BranchID) REFERENCES Branch (BranchID)
);

CREATE TABLE Member (
    MemberID INT IDENTITY(1,1) PRIMARY KEY,
	MoneyDue MONEY DEFAULT 0,
	RegistrationDate Date CHECK( RegistrationDate<=GETDATE()) NOT NULL,
	PersonId INT FOREIGN KEY REFERENCES Person(ID) UNIQUE
);

CREATE TABLE MemberSusbended (
    MemberID INT IDENTITY(1,1) PRIMARY KEY,
    MoneyDue MONEY DEFAULT 0,
	RegistrationDate Date CHECK( RegistrationDate<=GETDATE()) NOT NULL,
    PersonId INT FOREIGN KEY REFERENCES Person(ID) UNIQUE
);

create TABLE Rental (
    RentalID INT IDENTITY(1,1) PRIMARY KEY,
    MemberID INT NOT NULL,
    BookCopyID INT NOT NULL,
	BranchID INT check (BranchID in(1,2,3)) NOT NULL,
    RentalDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    ReturnDate DATE NOT NULL,
    FOREIGN KEY (MemberID) REFERENCES Member (MemberID),
    FOREIGN KEY (BookCopyID) REFERENCES BookCopy (BookCopyID),
	FOREIGN KEY (BranchID) REFERENCES Branch (BranchID),
	CHECK (RentalDate >=GETDATE())
);

create TABLE PreviousRental (
    RentalID INT,
    MemberID INT NOT NULL,
    BookCopyID INT NOT NULL,
	BranchID INT check (BranchID in(1,2,3)) NOT NULL,
    RentalDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    ReturnDate DATE NOT NULL,
    FOREIGN KEY (MemberID) REFERENCES Member (MemberID),
    FOREIGN KEY (BookCopyID) REFERENCES BookCopy (BookCopyID),
	FOREIGN KEY (BranchID) REFERENCES Branch (BranchID),
);

create TABLE Reserved(
	MemberID INT NOT NULL UNIQUE,
	BookCopyID INT NOT NULL,
	DateOfReservation Date NOT NULL,
	FOREIGN KEY (MemberID) REFERENCES Member (MemberID),
	FOREIGN KEY (BookCopyID) REFERENCES BookCopy (BookCopyID),
);

CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY,
    MemberID INT NOT NULL,
    ISBN VARCHAR(20) NOT NULL,
    Rating INT CHECK (Rating>=1 and Rating <=5) NOT NULL,
    Comment VARCHAR(200),
	FeedbackDate DATE NOT NULL,
    FOREIGN KEY (MemberID) REFERENCES Member (MemberID),
    FOREIGN KEY (ISBN) REFERENCES Book (ISBN)
);

/*******history tables********/


CREATE TABLE StaffHistory (
    StaffID INT,
    Position VARCHAR(50),
    BranchID INT,
    Salary MONEY,
    ContractStartDate DATE,
    ContractEndDate DATE,
    ModifiedAt DATETIME NOT NULL,
    Operation VARCHAR(10) NOT NULL
);

CREATE TABLE ShiftsHistory (
    StaffID INT,
    Day VARCHAR(15),
    StartTime TIME,
    EndTime TIME,
    ModifiedAt DATETIME NOT NULL,
    Operation VARCHAR(10) NOT NULL
);

CREATE TABLE LeavingsHistory (
    Reason VARCHAR(50),
    StaffID INT,
    LeavingDay DATE,
    ModifiedAt DATETIME NOT NULL,
    Operation VARCHAR(10) NOT NULL
);

CREATE TABLE BranchHistory (
    BranchID INT,
    Location VARCHAR(50),
    PhoneNumber VARCHAR(15),
    BranchAddress VARCHAR(250),
    OpenTime TIME,
    CloseTime TIME,
    ModifiedAt DATETIME NOT NULL,
    Operation VARCHAR(10) NOT NULL
);

CREATE TABLE BranchManagerHistory (
    ManagerID INT,
    StaffID INT,
    BranchID INT,
    ModifiedAt DATETIME NOT NULL,
    Operation VARCHAR(10) NOT NULL
);

CREATE TABLE SupervisorHistory (
    SupervisorID INT,
    StaffID INT,
    BranchID INT,
    ModifiedAt DATETIME NOT NULL,
    Operation VARCHAR(10) NOT NULL
);

CREATE TABLE StaffSupervisorHistory (
    StaffID INT,
    SupervisorID INT,
    ModifiedAt DATETIME NOT NULL,
    Operation VARCHAR(10) NOT NULL
);

CREATE TABLE BookHistory (
    ISBN VARCHAR(20),
    Title VARCHAR(100),
    Author VARCHAR(100),
    PublicationYear INT,
    Category VARCHAR(50),
    Rating MONEY,
    ModifiedAt DATETIME NOT NULL,
    Operation VARCHAR(10) NOT NULL,
	NumOfRatings INT default  0
);
create TABLE BookCopyHistory (
    BookCopyID INT,
    ISBN VARCHAR(20),
    Stat VARCHAR(20),
    BranchID INT,
    ModifiedAt DATETIME NOT NULL,
    Operation VARCHAR(10) NOT NULL
);

CREATE TABLE MemberHistory (
    MemberID INT ,
    MoneyDue MONEY,
	RegistrationDate Date,
    PersonId INT,
    ModifiedAt DATETIME NOT NULL,
    Operation VARCHAR(10) NOT NULL
);
CREATE TABLE RentalHistory (
    RentalID INT,
    MemberID INT,
    BookCopyID INT,
    BranchID INT,
    RentalDate DATE,
    DueDate DATE,
    ReturnDate DATE,
    ModifiedAt DATETIME NOT NULL,
    Operation VARCHAR(10) NOT NULL
);


CREATE TABLE ReservedHistory (
    MemberID INT,
    BookCopyID INT,
    DateOfReservation DATE,
    ModifiedAt DATETIME NOT NULL,
    Operation VARCHAR(10) NOT NULL
);

CREATE TABLE PersonHistory(
	ID INT,
	Name VARCHAR(50),
	Gender VARCHAR(1),
	BirthDate DATE,
	Email VARCHAR(50),
	ContactNumber VARCHAR(20),
	Address VARCHAR(100),
	ModifiedAt DATETIME NOT NULL,
    Operation VARCHAR(10) NOT NULL,
	Password VARBINARY(1000)
);

GO

CREATE PROCEDURE EncryptPassword
    @Password VARBINARY(1000),
    @EncryptedPassword VARBINARY(1000) OUTPUT
AS
BEGIN
    OPEN SYMMETRIC KEY Mysymmkey
    DECRYPTION BY CERTIFICATE Mycert;

    SET @EncryptedPassword = ENCRYPTBYKEY(KEY_GUID('Mysymmkey'), @Password);

    CLOSE SYMMETRIC KEY Mysymmkey;
END

GO
CREATE PROCEDURE DecryptPassword
    @EncryptedPassword VARBINARY(1000),
    @DecryptedPassword VARBINARY(1000) OUTPUT
AS
BEGIN
    OPEN SYMMETRIC KEY Mysymmkey
    DECRYPTION BY CERTIFICATE Mycert;

    SET @DecryptedPassword = DECRYPTBYKEY(@EncryptedPassword);

    CLOSE SYMMETRIC KEY Mysymmkey;
END

CREATE PROCEDURE EncryptPassword
    @PlainTextPassword VARBINARY(1000),
    @EncryptedPassword VARBINARY(1000) OUTPUT
AS
BEGIN
    OPEN SYMMETRIC KEY Mysymmkey
    DECRYPTION BY CERTIFICATE Mycert;

    SET @EncryptedPassword = ENCRYPTBYKEY(KEY_GUID('Mysymmkey'), @PlainTextPassword);

    CLOSE SYMMETRIC KEY Mysymmkey;
END