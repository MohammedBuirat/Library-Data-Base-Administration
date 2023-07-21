USE AlbayanLibrary;
GO

CREATE ROLE Manager;
CREATE ROLE Supervisor;
CREATE ROLE Staff;
CREATE ROLE Members;

GRANT ALL PRIVILEGES ON PERSON TO Manager WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON Staff TO Manager WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON Shifts TO Manager WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON Leavings TO Manager WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON Branch TO Manager WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON BranchManager TO Manager WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON Supervisor TO Manager WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON StaffSupervisor TO Manager WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON Book TO Manager WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON BookCopy TO Manager WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON Member TO Manager WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON MemberSusbended TO Manager WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON Rental TO Manager WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON Reserved TO Manager WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON Feedback TO Manager WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON PreviousRental TO Manager WITH GRANT OPTION;
GRANT EXECUTE ON EncryptPassword TO Manager;
GRANT EXECUTE ON DecryptPassword TO Manager;
GRANT INSERT ON StaffHistory TO Manager;
GRANT INSERT ON ShiftsHistory TO Manager;
GRANT INSERT ON LeavingsHistory TO Manager;
GRANT INSERT ON BranchHistory TO Manager;
GRANT INSERT ON BranchManagerHistory TO Manager;
GRANT INSERT ON SupervisorHistory TO Manager;
GRANT INSERT ON StaffSupervisorHistory TO Manager;
GRANT INSERT ON BookHistory TO Manager;
GRANT INSERT ON BookCopyHistory TO Manager;
GRANT INSERT ON MemberHistory TO Manager;
GRANT INSERT ON MemberSusbendedHistory TO Manager;
GRANT INSERT ON RentalHistory TO Manager;
GRANT INSERT ON ReservedHistory TO Manager;
GRANT INSERT ON PersonHistory TO Manager;

-- Grant necessary permissions to Supervisor role
GRANT SELECT, INSERT, UPDATE, DELETE ON Staff TO Supervisor;
GRANT SELECT, INSERT, UPDATE, DELETE ON Book TO Supervisor;
GRANT SELECT, INSERT, UPDATE, DELETE ON Rental TO Supervisor;
GRANT SELECT, INSERT, UPDATE, DELETE ON Reserved TO Supervisor;
GRANT SELECT, INSERT, UPDATE, DELETE ON Person TO Supervisor;
GRANT SELECT, INSERT, UPDATE, DELETE ON Member TO Supervisor;
GRANT SELECT, INSERT, UPDATE, DELETE ON Leavings TO Supervisor;
GRANT SELECT, INSERT ON PreviousRental TO Supervisor;
GRANT EXECUTE ON EncryptPassword TO Supervisor;
GRANT EXECUTE ON DecryptPassword TO Supervisor;
GRANT INSERT ON StaffHistory TO Supervisor;
GRANT INSERT ON BookHistory TO Supervisor;
GRANT INSERT ON RentalHistory TO Supervisor;
GRANT INSERT ON ReservedHistory TO Supervisor;
GRANT INSERT ON PersonHistory TO Supervisor;
GRANT INSERT ON MemberHistory TO Supervisor;
GRANT INSERT ON LeavingsHistory TO Supervisor;



-- Grant necessary permissions to Staff role
GRANT SELECT, INSERT, UPDATE, DELETE ON Book TO Staff;
GRANT SELECT, INSERT, UPDATE, DELETE ON Rental TO Staff;
GRANT SELECT, INSERT, UPDATE, DELETE ON Reserved TO Staff;
GRANT SELECT, INSERT, UPDATE, DELETE ON Person TO Staff;
GRANT SELECT, INSERT ON PreviousRental TO Staff;
GRANT SELECT, INSERT, UPDATE, DELETE ON Member TO Staff;
GRANT EXECUTE ON EncryptPassword TO Staff;
GRANT EXECUTE ON DecryptPassword TO Staff;
GRANT INSERT ON BookHistory TO Supervisor;
GRANT INSERT ON RentalHistory TO Supervisor;
GRANT INSERT ON ReservedHistory TO Supervisor;
GRANT INSERT ON PersonHistory TO Supervisor;
GRANT INSERT ON MemberHistory TO Supervisor;


-- Grant necessary permissions to User role
GRANT SELECT ON Book TO Members;
GRANT SELECT ON BookCopy TO Members;

EXECUTE sp_addlogin @loginame = 'Qassam', @passwd = '1234';
EXECUTE sp_addlogin @loginame = 'Mohammed', @passwd = '1234';

-- Create users Qassam and Mohammed
EXECUTE sp_adduser 'Qassam', 'Qassam';
EXECUTE sp_adduser 'Mohammed', 'Mohammed';

-- Assign the Manager role to Qassam
EXECUTE sp_addrolemember 'Manager', 'Qassam';

-- Assign the Supervisor role to Mohammed
EXECUTE sp_addrolemember 'db_owner', 'Mohammed';