use AlbayanLibrary

/**delete triggers **/

GO
-- Staff table trigger
CREATE TRIGGER Staff_DeleteTrigger
ON Staff
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO StaffHistory (StaffID,Position, BranchID, Salary, ContractStartDate, ContractEndDate, ModifiedAt, Operation)
    SELECT StaffID, Position, BranchID,Salary, ContractStartDate, ContractEndDate, GETDATE(), 'delete'
    FROM deleted; 
END;

GO
-- Shifts table trigger
CREATE TRIGGER Shifts_DeleteTrigger
ON Shifts
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO ShiftsHistory (StaffID, Day, StartTime, EndTime, ModifiedAt, Operation)
    SELECT StaffID, Day, StartTime, EndTime, GETDATE(), 'delete'
    FROM deleted;
END;

GO
-- Leavings table trigger
CREATE TRIGGER Leavings_DeleteTrigger
ON Leavings
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO LeavingsHistory (Reason, StaffID, LeavingDay, ModifiedAt, Operation)
    SELECT Reason, StaffID, LeavingDay, GETDATE(), 'delete'
    FROM deleted;
END;

GO
-- Branch table trigger
CREATE TRIGGER Branch_DeleteTrigger
ON Branch
INSTEAD OF DELETE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO BranchHistory (BranchID, Location, PhoneNumber, BranchAddress, OpenTime, CloseTime, ModifiedAt, Operation)
    SELECT BranchID, Location, PhoneNumber, BranchAddress, OpenTime, CloseTime, GETDATE(), 'delete'
    FROM deleted;
END;

GO
-- BranchManager table trigger
CREATE TRIGGER BranchManager_DeleteTrigger
ON BranchManager
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO BranchManagerHistory (ManagerID, StaffID, BranchID, ModifiedAt, Operation)
    SELECT ManagerID, StaffID, BranchID, GETDATE(), 'delete'
    FROM deleted;
END;

GO
-- Supervisor table trigger
CREATE TRIGGER Supervisor_DeleteTrigger
ON Supervisor
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO SupervisorHistory (SupervisorID, StaffID, BranchID, ModifiedAt, Operation)
    SELECT SupervisorID, StaffID, BranchID, GETDATE(), 'delete'
    FROM deleted;
END;

GO
-- StaffSupervisor table trigger
CREATE TRIGGER StaffSupervisor_DeleteTrigger
ON StaffSupervisor
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO StaffSupervisorHistory (StaffID, SupervisorID, ModifiedAt, Operation)
    SELECT StaffID, SupervisorID, GETDATE(), 'delete'
    FROM deleted;
END;

GO
-- Book table trigger
CREATE TRIGGER Book_DeleteTrigger
ON Book
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO BookHistory (ISBN, Title, Author, PublicationYear, Category, Rating,NumOfRatings, ModifiedAt, Operation)
    SELECT ISBN, Title, Author, PublicationYear, Category, Rating,NumOfRatings, GETDATE(), 'delete'
    FROM deleted;
END;

GO

-- BookCopy table trigger
CREATE TRIGGER BookCopy_DeleteTrigger
ON BookCopy
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO BookCopyHistory (BookCopyID, ISBN, Stat, BranchID, ModifiedAt, Operation)
    SELECT BookCopyID, ISBN, Stat, BranchID, GETDATE(), 'delete'
    FROM deleted;
END;

GO

-- Member table trigger
CREATE TRIGGER tr_Member_Delete
ON Member
INSTEAD OF DELETE
AS
BEGIN
    SET NOCOUNT ON;
	 -- Delete rental records associated with the deleted member
	UPDATE BookCopy
    SET Stat = 'Available'
    WHERE BookCopyID IN (
        SELECT BookCopyID
        FROM Rental
        WHERE MemberID IN (SELECT MemberID FROM deleted) AND ReturnDate IS NULL
    );

	UPDATE BookCopy
    SET Stat = 'Reserved'
    WHERE BookCopyID IN (
        SELECT BookCopyID
        FROM Reserved
    );
    DELETE FROM Rental
    WHERE MemberID IN (SELECT MemberID FROM deleted);
    -- Insert deleted member into MemberHistory table
    INSERT INTO MemberHistory (MemberID,RegistrationDate,ModifiedAt, Operation)
    SELECT MemberID, RegistrationDate,  GETDATE(), 'delete'
    FROM deleted;
    -- Insert deleted member into MemberSusbended table
    INSERT INTO MemberSusbended (MemberID,RegistrationDate)
    SELECT MemberID,RegistrationDate
    FROM deleted;
    -- Delete the member from Member table
    DELETE FROM Member
    WHERE MemberID IN (SELECT MemberID FROM deleted);
END;

GO

-- MemberSusbended table trigger
CREATE TRIGGER MemberSusbended_DeleteTrigger
ON MemberSusbended
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Member (MemberID,RegistrationDate,PersonId,MoneyDue)
    SELECT d.MemberID, d.RegistrationDate,d.PersonId,d.MoneyDue
    FROM deleted d;

   
END;

GO

-- Rental table trigger
CREATE TRIGGER Rental_DeleteTrigger
ON Rental
INSTEAD OF DELETE
AS
BEGIN
    SET NOCOUNT ON;
    -- Calculate MoneyDue based on rental duration
    UPDATE m
    SET m.MoneyDue = m.MoneyDue + CASE
        WHEN r.RentalDate < DATEADD(DAY, -14, GETDATE()) THEN 3 * DATEDIFF(DAY, r.RentalDate, ISNULL(r.ReturnDate, GETDATE()))
        ELSE 2 * DATEDIFF(DAY, r.RentalDate, ISNULL(r.ReturnDate, GETDATE()))
    END
    FROM Member m
    INNER JOIN deleted d ON m.MemberID = d.MemberID
    INNER JOIN Rental r ON d.RentalID = r.RentalID;

    -- Update book status to 'Available' or 'Reserved' based on Reserved table
    UPDATE BookCopy
    SET Stat = CASE
        WHEN EXISTS (
            SELECT 1
            FROM Reserved
            WHERE BookCopyID = BookCopy.BookCopyID
        ) THEN 'Reserved'
        ELSE 'Available'
    END
    WHERE BookCopyID IN (
        SELECT BookCopyID
        FROM Rental
        WHERE RentalID IN (SELECT RentalID FROM deleted)
    );

    -- Insert into RentalHistory table
    INSERT INTO RentalHistory (RentalID, MemberID, BookCopyID, BranchID, RentalDate, DueDate, ReturnDate, ModifiedAt, Operation)
    SELECT RentalID, MemberID, BookCopyID, BranchID, RentalDate, DueDate, ReturnDate, GETDATE(), 'delete'
    FROM deleted;

    -- Delete from Rental table
    DELETE FROM Rental
    WHERE RentalID IN (SELECT RentalID FROM deleted);
END;


GO
-- Reserved table trigger
CREATE TRIGGER Reserved_DeleteTrigger
ON Reserved
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    -- Update the status of the reserved books to Available
    UPDATE BookCopy
    SET Stat = 'Available'
    WHERE  BookCopyID IN (
        SELECT BookCopyID
		from Reserved
		where MemberID  IN(
		select MemberID FROM deleted
		)
    )
    -- Insert deleted reservation into ReservedHistory table
    INSERT INTO ReservedHistory (MemberID, BookCopyID, DateOfReservation, ModifiedAt, Operation)
    SELECT MemberID, BookCopyID, DateOfReservation, GETDATE(), 'delete'
    FROM deleted;
END;