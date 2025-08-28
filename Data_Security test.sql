create role Group6_user;
grant select, update, insert on mydatabase.* To Group6_user;
create user 'Lili' identified by 'Lili1234' default role 'Group6_user';
create user 'Boyan' identified by 'Boyan1234' default role 'Group6_user';
create user 'Jonathan' identified by 'Jonathan1234' default role 'Group6_user';
create user 'Junzhu' identified by 'Junzhu1234' default role 'Group6_user';

create role Group6_admin;
grant create, select, update, insert, delete on mydatabase.* To Group6_admin;
create user 'Suraj' identified by 'Suraj1234' default role 'Group6_admin'


-- Encrypt sensitive data (example for phone numbers)
Use mydatabase
CREATE TABLE EncryptedPhoneNumbers (
    UserID VARCHAR(10),
    EncryptedPhoneNumber VARBINARY(255), -- Encrypted phone number storage
    CONSTRAINT FK_EncryptedPhoneNumbers_UserID FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Add sample encrypted data (encryption would typically be done in the application layer)
INSERT INTO EncryptedPhoneNumbers (UserID, EncryptedPhoneNumber)
VALUES ('U001', AES_ENCRYPT('1234567890', 'encryption_key')); -- Replace 'encryption_key' with your actual key

-- Verify encryption
-- Retrieve the encrypted phone number
SELECT * FROM EncryptedPhoneNumbers;
-- Verify encryption
-- Retrieve the encrypted phone number
SELECT EncryptedPhoneNumber FROM EncryptedPhoneNumbers WHERE UserID = 'U001';

-- Decrypt the phone number
SELECT AES_DECRYPT(EncryptedPhoneNumber, 'encryption_key') AS DecryptedPhoneNumber FROM EncryptedPhoneNumbers WHERE UserID = 'U001';
