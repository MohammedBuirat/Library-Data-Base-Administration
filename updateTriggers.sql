USE AlbayanLibrary;

GO
/**update triggers**/
CREATE TRIGGER Staff_UpdateTrigger
ON Staff
AFTER
 UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO StaffHistory (StaffID,Position, BranchID,Salary, ContractStartDate, ContractEndDate, ModifiedAt, Operation)
    SELECT d.StaffID,d.Position, d.BranchID,d.Salary, d.ContractStartDate, d.ContractEndDate, GETDATE(), 'update'
    FROM deleted d
END;
GO
CREATE TRIGGER Shifts_UpdateTrigger
ON Shifts
AFTER
 UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO ShiftsHistory (StaffID, Day, StartTime, EndTime, ModifiedAt, Operation)
    SELECT d.StaffID, d.Day, d.StartTime, d.EndTime, GETDATE(), 'update'
    FROM deleted d
    INNER JOIN inserted i ON d.StaffID = i.StaffID;
END;

GO
CREATE TRIGGER Leavings_UpdateTrigger
ON Leavings
AFTER
 UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO LeavingsHistory (Reason, StaffID, LeavingDay, ModifiedAt, Operation)
    SELECT d.Reason, d.StaffID, d.LeavingDay, GETDATE(), 'update'
    FROM deleted d
    INNER JOIN inserted i ON d.StaffID = i.StaffID;
END;

GO

CREATE TRIGGER Branch_UpdateTrigger
ON Branch
AFTER
 UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO BranchHistory (BranchID, Location, PhoneNumber, BranchAddress, OpenTime, CloseTime, ModifiedAt, Operation)
    SELECT d.BranchID, d.Location, d.PhoneNumber, d.BranchAddress, d.OpenTime, d.CloseTime, GETDATE(), 'update'
    FROM deleted d
    INNER JOIN inserted i ON d.BranchID = i.BranchID;
END;

GO

CREATE TRIGGER BranchManager_UpdateTrigger
ON BranchManager
AFTER
 UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO BranchManagerHistory (ManagerID, StaffID, BranchID, ModifiedAt, Operation)
    SELECT d.ManagerID, d.StaffID, d.BranchID, GETDATE(), 'update'
    FROM deleted d
    INNER JOIN inserted i ON d.ManagerID = i.ManagerID;
END;

GO

CREATE TRIGGER Supervisor_UpdateTrigger
ON Supervisor
AFTER
 UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO SupervisorHistory (SupervisorID, StaffID, BranchID, ModifiedAt, Operation)
    SELECT d.SupervisorID, d.StaffID, d.BranchID, GETDATE(), 'update'
    FROM deleted d
    INNER JOIN inserted i ON d.SupervisorID = i.SupervisorID;
END;

GO

CREATE TRIGGER StaffSupervisor_UpdateTrigger
ON StaffSupervisor
AFTER
 UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO StaffSupervisorHistory (StaffID, SupervisorID, ModifiedAt, Operation)
    SELECT d.StaffID, d.SupervisorID, GETDATE(), 'update'
    FROM deleted d
    INNER JOIN inserted i ON d.StaffID = i.StaffID AND d.SupervisorID = i.SupervisorID;
END;

GO

CREATE TRIGGER Book_UpdateTrigger
ON Book
AFTER
 UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO BookHistory (ISBN, Title, Author, PublicationYear, Category, Rating,NumOfRatings, ModifiedAt, Operation)
    SELECT d.ISBN, d.Title, d.Author, d.PublicationYear, d.Category, d.Rating,d.NumOfRatings, GETDATE(), 'update'
    FROM deleted d
    INNER JOIN inserted i ON d.ISBN = i.ISBN;
END;

GO

CREATE TRIGGER BookCopy_UpdateTrigger
ON BookCopy
AFTER
 UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO BookCopyHistory (BookCopyID, ISBN, Stat, BranchID, ModifiedAt, Operation)
    SELECT d.BookCopyID, d.ISBN, d.Stat, d.BranchID, GETDATE(), 'update'
    FROM deleted d
    INNER JOIN inserted i ON d.BookCopyID = i.BookCopyID;
END;

GO

CREATE TRIGGER Member_UpdateTrigger
ON Member
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO MemberHistory (MemberID,RegistrationDate,ModifiedAt, Operation)
    SELECT d.MemberID,d.RegistrationDate,GETDATE(), 'update'
    FROM deleted d
    INNER JOIN inserted i ON d.MemberID = i.MemberID;
END;

GO

CREATE TRIGGER MemberSusbended_UpdateTrigger
ON MemberSusbended
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO MemberSusbendedHistory (MemberID,RegistrationDate, ModifiedAt, Operation)
    SELECT d.MemberID,d.RegistrationDate,GETDATE(), 'update'
    FROM deleted d
    INNER JOIN inserted i ON d.MemberID = i.MemberID;
END;

GO

CREATE TRIGGER Rental_UpdateTrigger
ON Rental
AFTER
 UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert updated rental into RentalHistory table
    INSERT INTO RentalHistory (RentalID, MemberID, BookCopyID, BranchID, RentalDate, DueDate, ReturnDate, ModifiedAt, Operation)
    SELECT d.RentalID, d.MemberID, d.BookCopyID, d.BranchID, d.RentalDate, d.DueDate, d.ReturnDate, GETDATE(), 'update'
    FROM deleted d
    INNER JOIN inserted i ON d.RentalID = i.RentalID;

    -- Update the status of the original book copy if the BookCopyID has changed and the status is 'Reserved'
    UPDATE BookCopy
    SET Stat = 'Available'
    WHERE BookCopyID IN (
        SELECT d.BookCopyID
        FROM deleted d
        INNER JOIN inserted i ON d.RentalID = i.RentalID
        WHERE d.BookCopyID <> i.BookCopyID AND d.BookCopyID IN (
            SELECT BookCopyID
            FROM BookCopy
            WHERE Stat = 'Reserved'
        )
    );
END;

GO

CREATE TRIGGER Reserved_UpdateTrigger
ON Reserved
AFTER
 UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Update status of previously reserved book to Available
    UPDATE bc
    SET Stat = 'Available'
    FROM BookCopy bc
    INNER JOIN deleted d ON bc.BookCopyID = d.BookCopyID
    WHERE d.BookCopyID <> d.BookCopyID AND bc.Stat = 'Reserved';

    -- Reserve the new book if it is available
    UPDATE bc
    SET Stat = 'Reserved'
    FROM BookCopy bc
    INNER JOIN inserted i ON bc.BookCopyID = i.BookCopyID
    WHERE bc.Stat = 'Available';

    -- Insert updated reservation into ReservedHistory table
    INSERT INTO ReservedHistory (MemberID, BookCopyID, DateOfReservation, ModifiedAt, Operation)
    SELECT d.MemberID, d.BookCopyID, d.DateOfReservation, GETDATE(), 'update'
    FROM deleted d
    INNER JOIN inserted i ON d.MemberID = i.MemberID AND d.BookCopyID = i.BookCopyID;
END;
GO

CREATE TRIGGER Person_UpdateTrigger
ON Person 
AFTER UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT * FROM inserted
        WHERE (Gender NOT IN ('M', 'F'))
           OR (BirthDate > GETDATE())
           OR (Email NOT LIKE '%@%.%')
    )
    BEGIN
        PRINT 'Constraints are not met';
    END
    ELSE
    BEGIN 
        DECLARE @PassEncrypted VARBINARY(1000);
        
        -- Retrieve the updated password and other values from the inserted table
        DECLARE @Password VARBINARY(1000);
        SELECT @Password = password FROM inserted;

        -- Call the EncryptPassword stored procedure to encrypt the password
        EXEC EncryptPassword @Password, @PassEncrypted OUTPUT;

		INSERT INTO PersonHistory (name, gender, birthdate, email, ContactNumber, Address, Password, ModifiedAt, Operation)
		SELECT d.name, d.gender, d.birthdate, d.email, d.ContactNumber, d.Address, @PassEncrypted, GETDATE(), 'update'
		FROM deleted d
		INNER JOIN PersonHistory ph ON ph.ID = d.ID;

        UPDATE Person
        SET name = d.name,
            gender = d.gender,
            birthdate = d.birthdate,
            email = d.email,
            ContactNumber = d.ContactNumber,
            Address = d.Address,
            Password = @PassEncrypted
        FROM Person p
        INNER JOIN inserted d ON p.ID = d.ID;
    END
END;
GO

