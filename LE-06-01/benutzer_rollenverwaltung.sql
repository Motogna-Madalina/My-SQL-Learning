-- -------------------------------------------------------
-- POINT 1: Create user and assign privileges
-- -----------------------------------------------------------
USE artikels;
-- Create user with password
CREATE USER IF NOT EXISTS 'lina_motogna'@'localhost'
IDENTIFIED BY 'secret';

-- Grant read, insert and update privileges on table
GRANT SELECT, INSERT, UPDATE
ON artikels.artikel
TO 'lina_motogna'@'localhost';

FLUSH PRIVILEGES;

-- -----------------------------------------------------------
-- POINT 2: Remove privileges and delete user (as admin)
-- -----------------------------------------------------------

-- Revoke all privileges
REVOKE ALL PRIVILEGES, GRANT OPTION
FROM 'lina_motogna'@'localhost';

-- Drop user
DROP USER 'lina_motogna'@'localhost';

-- -----------------------------------------------------------
-- POINT 3: Roles and role management
-- -----------------------------------------------------------
-- Create role
CREATE ROLE 'vertrieb';

-- Grant privileges to role
GRANT SELECT, INSERT, UPDATE
ON artikels.artikel
TO 'vertrieb';

-- Create new users
CREATE USER 'franz'@'localhost' IDENTIFIED BY 'secret';
CREATE USER 'maria'@'localhost' IDENTIFIED BY 'secret';

-- Assign role to users
GRANT 'vertrieb' TO 'franz'@'localhost';
GRANT 'vertrieb' TO 'maria'@'localhost';

-- Activate role by default
SET DEFAULT ROLE 'vertrieb' TO 'franz'@'localhost';
SET DEFAULT ROLE 'vertrieb' TO 'maria'@'localhost';

-- Modify role: remove INSERT and UPDATE (only SELECT remains)
REVOKE INSERT, UPDATE
ON artikels.artikel
FROM 'vertrieb';


-- Drop role (no longer needed)
DROP ROLE 'vertrieb';