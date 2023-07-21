
use AlbayanLibrary
/***person**/
-- Inserting person 1
INSERT INTO PERSON (Name, Gender, BirthDate, Email, ContactNumber, Address, Password)
VALUES ('John Doe', 'M', '1990-05-15', 'johndoe@example.com', '1234567890', '123 Main St', 0x0123456789);

-- Inserting person 2
INSERT INTO PERSON (Name, Gender, BirthDate, Email, ContactNumber, Address, Password)
VALUES ('Jane Smith', 'F', '1995-08-20', 'janesmith@example.com', '9876543210', '456 Elm St', 0x9876543210);

-- Inserting person 3
INSERT INTO PERSON (Name, Gender, BirthDate, Email, ContactNumber, Address, Password)
VALUES ('Michael Johnson', 'M', '1985-12-01', 'michaeljohnson@example.com', '5551234567', '789 Oak St', 0x0123456789);

-- Inserting person 4
INSERT INTO PERSON (Name, Gender, BirthDate, Email, ContactNumber, Address, Password)
VALUES ('Sarah Thompson', 'F', '1992-04-10', 'sarahthompson@example.com', '1231231234', '321 Pine St', 0x9876543210);

-- Inserting person 5
INSERT INTO PERSON (Name, Gender, BirthDate, Email, ContactNumber, Address, Password)
VALUES ('Robert Anderson', 'M', '1988-09-28', 'robertanderson@example.com', '9879879876', '654 Cedar St', 0x0123456789);

-- Inserting person 6
INSERT INTO PERSON (Name, Gender, BirthDate, Email, ContactNumber, Address, Password)
VALUES ('Emily Wilson', 'F', '1997-07-05', 'emilywilson@example.com', '1112223334', '987 Walnut St', 0x9876543210);

-- Inserting person 7
INSERT INTO PERSON (Name, Gender, BirthDate, Email, ContactNumber, Address, Password)
VALUES ('David Brown', 'M', '1993-02-12', 'davidbrown@example.com', '4445556667', '741 Maple St', 0x0123456789);

-- Inserting person 8
INSERT INTO PERSON (Name, Gender, BirthDate, Email, ContactNumber, Address, Password)
VALUES ('Jessica Davis', 'F', '1994-11-18', 'jessicadavis@example.com', '8889990001', '963 Birch St', 0x9876543210);

-- Inserting person 9
INSERT INTO PERSON (Name, Gender, BirthDate, Email, ContactNumber, Address, Password)
VALUES ('Christopher Miller', 'M', '1991-06-25', 'christophermiller@example.com', '2223334445', '852 Oak St', 0x0123456789);

-- Inserting person 10
INSERT INTO PERSON (Name, Gender, BirthDate, Email, ContactNumber, Address, Password)
VALUES ('Olivia Wilson', 'F', '1996-03-08', 'oliviawilson@example.com', '5554443332', '741 Elm St', 0x9876543210);

-- Inserting person 11
INSERT INTO PERSON (Name, Gender, BirthDate, Email, ContactNumber, Address, Password)
VALUES ('John Doe', 'M', '1990-05-15', 'john.doe2@example.com', '1234567891', '123 Main St', 0x0123456789);

-- Inserting person 12
INSERT INTO PERSON (Name, Gender, BirthDate, Email, ContactNumber, Address, Password)
VALUES ('Jane Smith', 'F', '1995-08-20', 'jane.smith2@example.com', '9876543211', '456 Elm St', 0x9876543210);

-- Inserting person 13
INSERT INTO PERSON (Name, Gender, BirthDate, Email, ContactNumber, Address, Password)
VALUES ('Michael Johnson', 'M', '1985-12-01', 'michael.johnson2@example.com', '5551234568', '789 Oak St', 0x0123456789);

-- Inserting person 14
INSERT INTO PERSON (Name, Gender, BirthDate, Email, ContactNumber, Address, Password)
VALUES ('Sarah Thompson', 'F', '1992-04-10', 'sarah.thompson2@example.com', '1231231235', '321 Pine St', 0x9876543210);

-- Inserting person 15
INSERT INTO PERSON (Name, Gender, BirthDate, Email, ContactNumber, Address, Password)
VALUES ('Robert Anderson', 'M', '1988-09-28', 'robert.anderson2@example.com', '9879879877', '654 Cedar St', 0x0123456789);

-- Inserting person 16
INSERT INTO PERSON (Name, Gender, BirthDate, Email, ContactNumber, Address, Password)
VALUES ('Emily Wilson', 'F', '1997-07-05', 'emily.wilson2@example.com', '1112223335', '987 Walnut St', 0x9876543210);

-- Inserting person 17
INSERT INTO PERSON (Name, Gender, BirthDate, Email, ContactNumber, Address, Password)
VALUES ('David Brown', 'M', '1993-02-12', 'david.brown2@example.com', '4445556668', '741 Maple St', 0x0123456789);

-- Inserting person 18
INSERT INTO PERSON (Name, Gender, BirthDate, Email, ContactNumber, Address, Password)
VALUES ('Jessica Davis', 'F', '1994-11-18', 'jessica.davis2@example.com', '8889990002', '963 Birch St', 0x9876543210);

-- Inserting person 19
INSERT INTO PERSON (Name, Gender, BirthDate, Email, ContactNumber, Address, Password)
VALUES ('Christopher Miller', 'M', '1991-06-25', 'christopher.miller2@example.com', '2223334446', '852 Oak St', 0x0123456789);

-- Inserting person 20
INSERT INTO PERSON (Name, Gender, BirthDate, Email, ContactNumber, Address, Password)
VALUES ('Olivia Wilson', 'F', '1996-03-08', 'olivia.wilson2@example.com', '5554443333', '741 Elm St', 0x9876543210);
















/***employee**/

-- Inserting staff member 1 (Manager for Branch 1)
INSERT INTO Staff (Position, BranchID, Salary, ContractStartDate, ContractEndDate, PersonId)
VALUES ('Manager', 1, 5000, '2021-01-01', '2023-09-30', 1);

-- Inserting staff member 2 (Manager for Branch 2)
INSERT INTO Staff (Position, BranchID, Salary, ContractStartDate, ContractEndDate, PersonId)
VALUES ('Manager', 2, 5000, '2021-02-15', '2023-09-30', 2);

-- Inserting staff member 3 (Manager for Branch 3)
INSERT INTO Staff (Position, BranchID, Salary, ContractStartDate, ContractEndDate, PersonId)
VALUES ('Manager', 3, 5000, '2021-03-30', '2023-09-30', 3);

-- Inserting staff member 4 (Supervisor for Branch 1)
INSERT INTO Staff (Position, BranchID, Salary, ContractStartDate, ContractEndDate, PersonId)
VALUES ('Supervisor', 1, 4000, '2021-04-12', '2023-09-30', 4);

-- Inserting staff member 5 (Supervisor for Branch 2)
INSERT INTO Staff (Position, BranchID, Salary, ContractStartDate, ContractEndDate, PersonId)
VALUES ('Supervisor', 2, 4000, '2021-05-25', '2023-09-30', 5);

-- Inserting staff members 6 to 10 (Normal Employees)
INSERT INTO Staff (Position, BranchID, Salary, ContractStartDate, ContractEndDate, PersonId)
VALUES ('Employee', 3, 3000, '2021-06-07', '2023-09-30', 6);

INSERT INTO Staff (Position, BranchID, Salary, ContractStartDate, ContractEndDate, PersonId)
VALUES ('Employee', 1, 2500, '2021-07-20', '2023-09-30', 7);

INSERT INTO Staff (Position, BranchID, Salary, ContractStartDate, ContractEndDate, PersonId)
VALUES ('Employee', 2, 2800, '2021-08-02', '2023-09-30', 8);

INSERT INTO Staff (Position, BranchID, Salary, ContractStartDate, ContractEndDate, PersonId)
VALUES ('Employee', 3, 3000, '2021-09-15', '2023-09-30', 9);

INSERT INTO Staff (Position, BranchID, Salary, ContractStartDate, ContractEndDate, PersonId)
VALUES ('Employee', 1, 2500, '2021-10-28', '2023-09-30', 10);






/**shifts**/

INSERT INTO Shifts (StaffID, Day, StartTime, EndTime)
VALUES (1, 'Monday', '09:00:00', '17:00:00');

INSERT INTO Shifts (StaffID, Day, StartTime, EndTime)
VALUES (1, 'Tuesday', '09:00:00', '17:00:00');

INSERT INTO Shifts (StaffID, Day, StartTime, EndTime)
VALUES (1, 'Wednesday', '09:00:00', '17:00:00');

INSERT INTO Shifts (StaffID, Day, StartTime, EndTime)
VALUES (1, 'Thursday', '09:00:00', '17:00:00');

INSERT INTO Shifts (StaffID, Day, StartTime, EndTime)
VALUES (1, 'Friday', '09:00:00', '17:00:00');

-- Inserting shifts for staff member 2 (Manager for Branch 2)
INSERT INTO Shifts (StaffID, Day, StartTime, EndTime)
VALUES (2, 'Monday', '09:00:00', '17:00:00');

INSERT INTO Shifts (StaffID, Day, StartTime, EndTime)
VALUES (2, 'Tuesday', '09:00:00', '17:00:00');

INSERT INTO Shifts (StaffID, Day, StartTime, EndTime)
VALUES (2, 'Wednesday', '09:00:00', '17:00:00');

INSERT INTO Shifts (StaffID, Day, StartTime, EndTime)
VALUES (2, 'Thursday', '09:00:00', '17:00:00');

INSERT INTO Shifts (StaffID, Day, StartTime, EndTime)
VALUES (2, 'Friday', '09:00:00', '17:00:00');

-- Inserting shifts for staff member 3 (Manager for Branch 3)
INSERT INTO Shifts (StaffID, Day, StartTime, EndTime)
VALUES (3, 'Monday', '09:00:00', '17:00:00');

INSERT INTO Shifts (StaffID, Day, StartTime, EndTime)
VALUES (3, 'Tuesday', '09:00:00', '17:00:00');

INSERT INTO Shifts (StaffID, Day, StartTime, EndTime)
VALUES (3, 'Wednesday', '09:00:00', '17:00:00');

INSERT INTO Shifts (StaffID, Day, StartTime, EndTime)
VALUES (3, 'Thursday', '09:00:00', '17:00:00');

INSERT INTO Shifts (StaffID, Day, StartTime, EndTime)
VALUES (3, 'Friday', '09:00:00', '17:00:00');

-- Inserting shifts for staff member 4 (Supervisor for Branch 1)
INSERT INTO Shifts (StaffID, Day, StartTime, EndTime)
VALUES (4, 'Monday', '10:00:00', '18:00:00');

INSERT INTO Shifts (StaffID, Day, StartTime, EndTime)
VALUES (4, 'Tuesday', '10:00:00', '18:00:00');

INSERT INTO Shifts (StaffID, Day, StartTime, EndTime)
VALUES (4, 'Wednesday', '10:00:00', '18:00:00');

-- Inserting shifts for staff member 5 (Supervisor for Branch 2)
INSERT INTO Shifts (StaffID, Day, StartTime, EndTime)
VALUES (5, 'Monday', '10:00:00', '18:00:00');

INSERT INTO Shifts (StaffID, Day, StartTime, EndTime)
VALUES (5, 'Tuesday', '10:00:00', '18:00:00');

INSERT INTO Shifts (StaffID, Day, StartTime, EndTime)
VALUES (5, 'Wednesday', '10:00:00', '18:00:00');

INSERT INTO Shifts (StaffID, Day, StartTime, EndTime)
VALUES (6, 'Monday', '08:00:00', '16:00:00');

INSERT INTO Shifts (StaffID, Day, StartTime, EndTime)
VALUES (6, 'Tuesday', '08:00:00', '16:00:00');

INSERT INTO Shifts (StaffID, Day, StartTime, EndTime)
VALUES (6, 'Wednesday', '08:00:00', '16:00:00');

INSERT INTO Shifts (StaffID, Day, StartTime, EndTime)
VALUES (6, 'Thursday', '08:00:00', '16:00:00');

-- Inserting shifts for staff member 7 (Normal Employee)
INSERT INTO Shifts (StaffID, Day, StartTime, EndTime)
VALUES (7, 'Tuesday', '10:00:00', '18:00:00');

INSERT INTO Shifts (StaffID, Day, StartTime, EndTime)
VALUES (7, 'Wednesday', '10:00:00', '18:00:00');

INSERT INTO Shifts (StaffID, Day, StartTime, EndTime)
VALUES (7, 'Thursday', '10:00:00', '18:00:00');

-- Inserting shifts for staff member 8 (Normal Employee)
INSERT INTO Shifts (StaffID, Day, StartTime, EndTime)
VALUES (8, 'Wednesday', '08:00:00', '16:00:00');

INSERT INTO Shifts (StaffID, Day, StartTime, EndTime)
VALUES (8, 'Thursday', '08:00:00', '16:00:00');

INSERT INTO Shifts (StaffID, Day, StartTime, EndTime)
VALUES (8, 'Friday', '08:00:00', '16:00:00');

-- Inserting shifts for staff member 9 (Normal Employee)
INSERT INTO Shifts (StaffID, Day, StartTime, EndTime)
VALUES (9, 'Thursday', '10:00:00', '18:00:00');

INSERT INTO Shifts (StaffID, Day, StartTime, EndTime)
VALUES (9, 'Friday', '10:00:00', '18:00:00');

INSERT INTO Shifts (StaffID, Day, StartTime, EndTime)
VALUES (9, 'Saturday', '10:00:00', '18:00:00');

-- Inserting shifts for staff member 10 (Normal Employee)
INSERT INTO Shifts (StaffID, Day, StartTime, EndTime)
VALUES (10, 'Friday', '08:00:00', '16:00:00');

INSERT INTO Shifts (StaffID, Day, StartTime, EndTime)
VALUES (10, 'Saturday', '08:00:00', '16:00:00');





/**leaving**/
-- Inserting leave record 1
INSERT INTO Leavings (Reason, StaffID, LeavingDay)
VALUES ('Sick Leave', 1, '2023-07-01');

-- Inserting leave record 2
INSERT INTO Leavings (Reason, StaffID, LeavingDay)
VALUES ('Vacation', 3, '2023-07-02');

-- Inserting leave record 3
INSERT INTO Leavings (Reason, StaffID, LeavingDay)
VALUES ('Sick Leave', 5, '2023-07-05');

-- Inserting leave record 4
INSERT INTO Leavings (Reason, StaffID, LeavingDay)
VALUES ('Vacation', 7, '2023-07-07');

-- Inserting leave record 5
INSERT INTO Leavings (Reason, StaffID, LeavingDay)
VALUES ('Sick Leave', 9, '2023-07-10');



/**branches**/
INSERT INTO Branch (BranchID, Location, PhoneNumber, BranchAddress, OpenTime, CloseTime)
VALUES (1, 'Dubai', '+971123456789', '123 Main Street, Dubai', '09:00:00', '18:00:00');

-- Inserting branch 2
INSERT INTO Branch (BranchID, Location, PhoneNumber, BranchAddress, OpenTime, CloseTime)
VALUES (2, 'Ramallah', '+970123456789', '456 Elm Street, Ramallah', '08:30:00', '17:30:00');

-- Inserting branch 3
INSERT INTO Branch (BranchID, Location, PhoneNumber, BranchAddress, OpenTime, CloseTime)
VALUES (3, 'Amman', '+962123456789', '789 Oak Street, Amman', '08:00:00', '17:00:00');


/**manager**/
-- Inserting branch manager for Branch 1
INSERT INTO BranchManager (StaffID, BranchID)
VALUES (1, 1);

-- Inserting branch manager for Branch 2
INSERT INTO BranchManager (StaffID, BranchID)
VALUES (2, 2);
-- Inserting branch manager for Branch 3
INSERT INTO BranchManager (StaffID, BranchID)
VALUES (3, 3);

-- Retrieve the data from the BranchManager table
SELECT * FROM BranchManager;



/**Supervisor**/
-- Inserting supervisor for staff member 4 (Supervisor for Branch 1)
INSERT INTO Supervisor (StaffID, BranchID)
VALUES (4, 1);

-- Inserting supervisor for staff member 5 (Supervisor for Branch 2)
INSERT INTO Supervisor (StaffID, BranchID)
VALUES (5, 2);

-- Retrieve the data from the Supervisor table
SELECT * FROM Supervisor;

INSERT INTO StaffSupervisor (StaffID, SupervisorID)
VALUES (7, 1);

INSERT INTO StaffSupervisor (StaffID, SupervisorID)
VALUES (10, 1);

-- Assigning supervisor 2 with employee 8
INSERT INTO StaffSupervisor (StaffID, SupervisorID)
VALUES (8, 2);



/**BOOKS**/


-- Inserting book 1
INSERT INTO Book (ISBN, Title, Author, PublicationYear, Category, Rating, NumOfRatings)
VALUES ('9780132350884', 'Clean Code: A Handbook of Agile Software Craftsmanship', 'Robert C. Martin', 2008, 'Programming', NULL, 0);

-- Inserting book 2
INSERT INTO Book (ISBN, Title, Author, PublicationYear, Category, Rating, NumOfRatings)
VALUES ('9780201835953', 'The Pragmatic Programmer: Your Journey to Mastery', 'Andrew Hunt, David Thomas', 1999, 'Programming', NULL, 0);

-- Inserting book 3
INSERT INTO Book (ISBN, Title, Author, PublicationYear, Category, Rating, NumOfRatings)
VALUES ('9780201633610', 'Design Patterns: Elements of Reusable Object-Oriented Software', 'Erich Gamma, Richard Helm, Ralph Johnson, John Vlissides', 1994, 'Programming', NULL, 0);

-- Inserting book 4
INSERT INTO Book (ISBN, Title, Author, PublicationYear, Category, Rating, NumOfRatings)
VALUES ('9780596007126', 'Head First Design Patterns', 'Eric Freeman, Elisabeth Robson, Bert Bates, Kathy Sierra', 2004, 'Programming', NULL, 0);

-- Inserting book 5
INSERT INTO Book (ISBN, Title, Author, PublicationYear, Category, Rating, NumOfRatings)
VALUES ('9780321125217', 'Refactoring: Improving the Design of Existing Code', 'Martin Fowler', 1999, 'Programming', NULL, 0);

-- Inserting book 6
INSERT INTO Book (ISBN, Title, Author, PublicationYear, Category, Rating, NumOfRatings)
VALUES ('9780061120084', 'To Kill a Mockingbird', 'Harper Lee', 1960, 'Fiction', NULL, 0);

-- Inserting book 7
INSERT INTO Book (ISBN, Title, Author, PublicationYear, Category, Rating, NumOfRatings)
VALUES ('9780451524935', '1984', 'George Orwell', 1949, 'Fiction', NULL, 0);

-- Inserting book 8
INSERT INTO Book (ISBN, Title, Author, PublicationYear, Category, Rating, NumOfRatings)
VALUES ('9780140283334', 'Pride and Prejudice', 'Jane Austen', 1813, 'Fiction', NULL, 0);

-- Inserting book 9
INSERT INTO Book (ISBN, Title, Author, PublicationYear, Category, Rating, NumOfRatings)
VALUES ('9780062315007', 'The Great Gatsby', 'F. Scott Fitzgerald', 1925, 'Fiction', NULL, 0);

-- Inserting book 10
INSERT INTO Book (ISBN, Title, Author, PublicationYear, Category, Rating, NumOfRatings)
VALUES ('9780446310789', 'To Kill a Mockingbird', 'Harper Lee', 1960, 'Fiction', NULL, 0);


/**Book Copy**/

INSERT INTO BookCopy (ISBN, Stat, BranchID)
VALUES ('9780132350884', 'Available', 1);

INSERT INTO BookCopy (ISBN, Stat, BranchID)
VALUES ('9780201835953', 'Available', 2);

INSERT INTO BookCopy (ISBN, Stat, BranchID)
VALUES ('9780201633610', 'Available', 3);

INSERT INTO BookCopy (ISBN, Stat, BranchID)
VALUES ('9780596007126', 'Available', 1);

INSERT INTO BookCopy (ISBN, Stat, BranchID)
VALUES ('9780321125217', 'Available', 2);

INSERT INTO BookCopy (ISBN, Stat, BranchID)
VALUES ('9780061120084', 'Available', 3);

INSERT INTO BookCopy (ISBN, Stat, BranchID)
VALUES ('9780451524935', 'Available', 1);

INSERT INTO BookCopy (ISBN, Stat, BranchID)
VALUES ('9780140283334', 'Available', 2);

INSERT INTO BookCopy (ISBN, Stat, BranchID)
VALUES ('9780062315007', 'Available', 3);

INSERT INTO BookCopy (ISBN, Stat, BranchID)
VALUES ('9780446310789', 'Available', 1);

INSERT INTO BookCopy (ISBN, Stat, BranchID)
VALUES ('9780132350884', 'Available', 2);

INSERT INTO BookCopy (ISBN, Stat, BranchID)
VALUES ('9780201835953', 'Available', 3);

INSERT INTO BookCopy (ISBN, Stat, BranchID)
VALUES ('9780201633610', 'Available', 1);

INSERT INTO BookCopy (ISBN, Stat, BranchID)
VALUES ('9780596007126', 'Available', 2);

INSERT INTO BookCopy (ISBN, Stat, BranchID)
VALUES ('9780321125217', 'Available', 3);

INSERT INTO BookCopy (ISBN, Stat, BranchID)
VALUES ('9780061120084', 'Available', 1);

INSERT INTO BookCopy (ISBN, Stat, BranchID)
VALUES ('9780451524935', 'Available', 2);

INSERT INTO BookCopy (ISBN, Stat, BranchID)
VALUES ('9780140283334', 'Available', 3);

INSERT INTO BookCopy (ISBN, Stat, BranchID)
VALUES ('9780062315007', 'Available', 1);

INSERT INTO BookCopy (ISBN, Stat, BranchID)
VALUES ('9780446310789', 'Available', 2);


-- Inserting book copies for books 21 to 40
INSERT INTO BookCopy (ISBN, Stat, BranchID)
VALUES ('9780132350884', 'Available', 3);

INSERT INTO BookCopy (ISBN, Stat, BranchID)
VALUES ('9780201835953', 'Available', 1);

INSERT INTO BookCopy (ISBN, Stat, BranchID)
VALUES ('9780201633610', 'Available', 2);

INSERT INTO BookCopy (ISBN, Stat, BranchID)
VALUES ('9780596007126', 'Available', 3);

INSERT INTO BookCopy (ISBN, Stat, BranchID)
VALUES ('9780321125217', 'Available', 1);

INSERT INTO BookCopy (ISBN, Stat, BranchID)
VALUES ('9780061120084', 'Available', 2);

INSERT INTO BookCopy (ISBN, Stat, BranchID)
VALUES ('9780451524935', 'Available', 3);

INSERT INTO BookCopy (ISBN, Stat, BranchID)
VALUES ('9780140283334', 'Available', 1);

INSERT INTO BookCopy (ISBN, Stat, BranchID)
VALUES ('9780062315007', 'Available', 2);

INSERT INTO BookCopy (ISBN, Stat, BranchID)
VALUES ('9780446310789', 'Available', 3);

INSERT INTO BookCopy (ISBN, Stat, BranchID)
VALUES ('9780132350884', 'Available', 1);

INSERT INTO BookCopy (ISBN, Stat, BranchID)
VALUES ('9780201835953', 'Available', 2);

INSERT INTO BookCopy (ISBN, Stat, BranchID)
VALUES ('9780201633610', 'Available', 3);

INSERT INTO BookCopy (ISBN, Stat, BranchID)
VALUES ('9780596007126', 'Available', 1);

INSERT INTO BookCopy (ISBN, Stat, BranchID)
VALUES ('9780321125217', 'Available', 2);

INSERT INTO BookCopy (ISBN, Stat, BranchID)
VALUES ('9780061120084', 'Available', 3);

INSERT INTO BookCopy (ISBN, Stat, BranchID)
VALUES ('9780451524935', 'Available', 1);

INSERT INTO BookCopy (ISBN, Stat, BranchID)
VALUES ('9780140283334', 'Available', 2);

INSERT INTO BookCopy (ISBN, Stat, BranchID)
VALUES ('9780062315007', 'Available', 3);

INSERT INTO BookCopy (ISBN, Stat, BranchID)
VALUES ('9780446310789', 'Available', 1);


/**member**/
INSERT INTO Member (MoneyDue, RegistrationDate, PersonId)
VALUES (0, GETDATE(), 11);

-- Inserting member 12
INSERT INTO Member (MoneyDue, RegistrationDate, PersonId)
VALUES (0, GETDATE(), 12);

-- Inserting member 13
INSERT INTO Member (MoneyDue, RegistrationDate, PersonId)
VALUES (0, GETDATE(), 13);

-- Inserting member 14
INSERT INTO Member (MoneyDue, RegistrationDate, PersonId)
VALUES (0, GETDATE(), 14);

-- Inserting member 15
INSERT INTO Member (MoneyDue, RegistrationDate, PersonId)
VALUES (0, GETDATE(), 15);

-- Inserting member 16
INSERT INTO Member (MoneyDue, RegistrationDate, PersonId)
VALUES (0, GETDATE(), 16);

-- Inserting member 17
INSERT INTO Member (MoneyDue, RegistrationDate, PersonId)
VALUES (0, GETDATE(), 17);

-- Inserting member 18
INSERT INTO Member (MoneyDue, RegistrationDate, PersonId)
VALUES (0, GETDATE(), 18);

-- Inserting member 19
INSERT INTO Member (MoneyDue, RegistrationDate, PersonId)
VALUES (0, GETDATE(), 19);

-- Inserting member 20
INSERT INTO Member (MoneyDue, RegistrationDate, PersonId)
VALUES (0, GETDATE(), 20);


