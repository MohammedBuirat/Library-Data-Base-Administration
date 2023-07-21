Use AlbayanLibrary

GO
CREATE TRIGGER tr_Staff_Insert
ON Staff
AFTER INSERT
AS
    BEGIN
        INSERT INTO StaffHistory (StaffID, Position, BranchID, Salary, ContractStartDate, ContractEndDate, ModifiedAt, Operation)
        SELECT StaffID, Position, BranchID,Salary, ContractStartDate, ContractEndDate, GETDATE(), 'insert'
        FROM Staff
        WHERE StaffID IN (SELECT SCOPE_IDENTITY());
END;
-- Trigger for Shifts table
GO
create TRIGGER tr_Shifts_Insert
ON Shifts
AFTER INSERT 
AS
BEGIN

		IF EXISTS (
		SELECT COUNT(StaffID) AS StaffCount
		FROM Shifts
		WHERE StaffID = (select staffid from inserted)
		GROUP BY StaffID
		HAVING COUNT(StaffID) > 6
		)
		BEGIN
		PRINT 'our policy will not allow employees to work more than 6 days a week'
			ROLLBACK;
		END

        -- Insert into ShiftsHistory table
        INSERT INTO ShiftsHistory (StaffID, Day, StartTime, EndTime, ModifiedAt, Operation)
        SELECT StaffID, Day, StartTime, EndTime, GETDATE(), 'insert'
        FROM Shifts
        WHERE StaffID IN (SELECT StaffID FROM inserted);
END;

GO
-- Trigger for Leavings table
CREATE TRIGGER tr_Leavings_Insert
ON Leavings
AFTER INSERT
AS
    BEGIN
        -- Insert into LeavingsHistory table
        INSERT INTO LeavingsHistory (Reason, StaffID, LeavingDay, ModifiedAt, Operation)
        SELECT Reason, StaffID, LeavingDay, GETDATE(), 'insert'
        FROM Leavings
        WHERE StaffID IN (SELECT StaffID FROM inserted);
    
END;
GO

CREATE TRIGGER tr_Branch_Insert
ON Branch
AFTER INSERT
AS
BEGIN
        -- Insert into BranchHistory table
        INSERT INTO BranchHistory (BranchID, Location, PhoneNumber, BranchAddress, OpenTime, CloseTime, ModifiedAt, Operation)
        SELECT BranchID, Location, PhoneNumber, BranchAddress, OpenTime, CloseTime, GETDATE(), 'insert'
        FROM inserted;
END;

GO
-- Trigger for BranchManager table
CREATE TRIGGER tr_BranchManager_Insert
ON BranchManager
AFTER INSERT
AS
BEGIN
        -- Insert into BranchManagerHistory table
        INSERT INTO BranchManagerHistory (ManagerID, StaffID, BranchID, ModifiedAt, Operation)
        SELECT ManagerID, StaffID, BranchID, GETDATE(), 'insert'
        FROM inserted;
END;

GO 

-- Trigger for Supervisor table
CREATE TRIGGER tr_Supervisor_Insert
ON Supervisor
AFTER INSERT
AS
BEGIN
	IF EXISTS (
		SELECT StaffID 
		FROM inserted 
		WHERE StaffID IN (SELECT StaffID FROM BranchManager)
	)
	BEGIN
	PRINT 'Staff member can not be both supervisor and manager';
    ROLLBACK;
	END

        -- Insert into SupervisorHistory table
        INSERT INTO SupervisorHistory (SupervisorID, StaffID, BranchID, ModifiedAt, Operation)
        SELECT SupervisorID, StaffID, BranchID, GETDATE(), 'insert'
        FROM inserted;
END;

GO

-- Trigger for StaffSupervisor table
CREATE TRIGGER tr_StaffSupervisor_Insert
ON StaffSupervisor
AFTER INSERT
AS
BEGIN
    -- Insert into StaffSupervisorHistory table
    INSERT INTO StaffSupervisorHistory (StaffID, SupervisorID, ModifiedAt, Operation)
    SELECT StaffID, SupervisorID, GETDATE(), 'insert'
    FROM inserted;
END;

GO

-- Trigger for Book table
CREATE TRIGGER tr_Book_Insert
ON Book
AFTER INSERT
AS
BEGIN
        -- Insert into BookHistory table
        INSERT INTO BookHistory (ISBN, Title, Author, PublicationYear, Category, Rating,NumOfRatings, ModifiedAt, Operation)
        SELECT ISBN, Title, Author, PublicationYear, Category, Rating,NumOfRatings, GETDATE(), 'insert'
        FROM inserted;
    
END;

GO

-- Trigger for BookCopy table
CREATE TRIGGER tr_BookCopy_Insert
ON BookCopy
AFTER INSERT
AS
BEGIN
        -- Insert into BookCopyHistory table
        INSERT INTO BookCopyHistory (BookCopyID, ISBN, Stat, BranchID, ModifiedAt, Operation)
        SELECT BookCopyID, ISBN, Stat, BranchID, GETDATE(), 'insert'
        FROM inserted;    
END;

GO
-- Trigger for Member table
CREATE TRIGGER tr_Member_Insert
ON Member
AFTER INSERT
AS
BEGIN
        -- Insert into MemberHistory table
        INSERT INTO MemberHistory (MemberID,RegistrationDate, ModifiedAt, Operation)
        SELECT MemberID,RegistrationDate, GETDATE(), 'insert'
        FROM inserted;
END;

GO

-- Trigger for MemberSusbended table
CREATE TRIGGER tr_MemberSusbended_Insert
ON MemberSusbended
AFTER INSERT
AS
BEGIN
        -- Insert into MemberSusbendedHistory table
        INSERT INTO MemberSusbendedHistory (MemberID, RegistrationDate, ModifiedAt, Operation)
        SELECT MemberID, RegistrationDate, GETDATE(), 'insert'
        FROM inserted;
END;

GO

-- Trigger for Rental table
CREATE TRIGGER tr_Rental_Insert
ON Rental
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT MemberID
        FROM (
            SELECT MemberID, COUNT(*) AS RentalCount
            FROM Rental
            WHERE MemberID IN (SELECT MemberID FROM inserted)
            GROUP BY MemberID
        ) AS RentalCountTable
        WHERE RentalCount > 4
    )
    BEGIN
        -- Print error message if member has more than 4 rentals
        PRINT 'Error: Member has reached the maximum rental limit.';
		ROLLBACK;
    END
    ELSE IF EXISTS (
        SELECT *
        FROM inserted i
        WHERE EXISTS (
            SELECT *
            FROM BookCopy bc
            WHERE bc.BookCopyID = i.BookCopyID
            AND (
                bc.Stat = 'Checked-out'
                OR (
                    bc.Stat = 'Reserved'
                    AND NOT EXISTS (
                        SELECT *
                        FROM Reserved r
                        WHERE r.BookCopyID = bc.BookCopyID
                        AND r.MemberID = i.MemberID
                    )
                )
            )
        )
    )
    BEGIN
        -- Print error message if book is checked-out or reserved by another member
        PRINT 'Error: Book is either checked-out or reserved by another member.';
		ROLLBACK;
    END
    ELSE
    BEGIN
        -- Insert into RentalHistory table
        INSERT INTO RentalHistory (RentalID, MemberID, BookCopyID, BranchID, RentalDate, DueDate, ReturnDate, ModifiedAt, Operation)
        SELECT RentalID, MemberID, BookCopyID, BranchID, RentalDate, DueDate, ReturnDate, GETDATE(), 'insert'
        FROM inserted;
    END
END;


GO

-- Trigger for Reserved table
CREATE TRIGGER tr_Reserved_Insert
ON Reserved
AFTER INSERT
AS
BEGIN
    -- Insert into ReservedHistory table
    INSERT INTO ReservedHistory (MemberID, BookCopyID, DateOfReservation, ModifiedAt, Operation)
    SELECT MemberID, BookCopyID, DateOfReservation, GETDATE(), 'insert'
    FROM inserted;
END;


GO
-- Trigger for Feedback table
CREATE TRIGGER tr_Feedback_Insert
ON Feedback
AFTER INSERT
AS
BEGIN
    DECLARE @ISBN VARCHAR(20);
	SELECT @ISBN = ISBN
	from inserted 


	IF EXISTS(SELECT Rating FROM Book WHERE ISBN=@ISBN AND Rating IS NOT NULL)
	BEGIN
	UPDATE Book
	SET NumOfRatings = NumOfRatings + 1,
    Rating = ((Rating * NumOfRatings) + 1) / (NumOfRatings + 1)
	WHERE ISBN = @ISBN;
	END
	ELSE
	BEGIN
	UPDATE Book
    SET NumOfRatings = 1,
        Rating = (SELECT Rating FROM inserted)
    WHERE ISBN = @ISBN;
	END
END;

GO
CREATE TRIGGER Person_InsertTrigger
ON Person 
INSTEAD OF INSERT
AS
BEGIN
	IF EXISTS (
		SELECT *
		FROM inserted
		WHERE (Gender NOT IN ('M', 'F')) OR
			(BirthDate > GETDATE()) OR
			(Email NOT LIKE '%@%.%') OR
			(Email in (SELECT Email from Person)) OR
			(ContactNumber in (Select ContactNumber from person))
	)
	BEGIN
		PRINT 'Constraints are not met';
	END
	ELSE
	BEGIN 
		DECLARE @PassEncrypted VARBINARY(1000);
		DECLARE @Password VARBINARY(1000);
		SELECT @Password = password FROM inserted;

		-- Call the EncryptPassword stored procedure to encrypt the password
		EXEC EncryptPassword @Password, @PassEncrypted OUTPUT;

		INSERT INTO PersonHistory (name, gender, birthdate, email, ContactNumber, Address, Password, ModifiedAt, Operation)
		SELECT name, gender, birthdate, email, ContactNumber, Address, @PassEncrypted, GETDATE(), 'insert'
		FROM inserted;

		INSERT INTO Person (name, gender, birthdate, email, ContactNumber, Address, Password)
		SELECT name, gender, birthdate, email, ContactNumber, Address, @PassEncrypted
		FROM inserted;
	END
END;
GO
