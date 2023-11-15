-- Create a table to store RADIUS clients
CREATE TABLE radclients (
    id SERIAL PRIMARY KEY,
    nasname VARCHAR(128) NOT NULL,
    shortname VARCHAR(32) NOT NULL,
    type VARCHAR(30) DEFAULT 'other',
    secret VARCHAR(60) NOT NULL,
    CONSTRAINT radclients_unique UNIQUE (nasname)
);

-- Create a table to store RADIUS users
CREATE TABLE radcheck (
    id SERIAL PRIMARY KEY,
    username VARCHAR(64) NOT NULL,
    attribute VARCHAR(64) NOT NULL,
    op CHAR(2) NOT NULL,
    value VARCHAR(253) NOT NULL,
    CONSTRAINT radcheck_unique UNIQUE (username, attribute)
);

-- Create a table to store RADIUS group memberships
CREATE TABLE radusergroup (
    username VARCHAR(64) NOT NULL,
    groupname VARCHAR(64) NOT NULL,
    priority INT DEFAULT 1,
    CONSTRAINT radusergroup_unique UNIQUE (username, groupname)
);
