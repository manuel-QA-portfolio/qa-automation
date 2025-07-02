DROP TABLE IF EXISTS transaction;
DROP TYPE IF EXISTS transaction_type;
DROP TYPE IF EXISTS provider_type;

CREATE TYPE transaction_type AS ENUM ('WITHDRAWAL', 'DEPOSIT', 'TRANSFER', 'FEE', 'FINE');
CREATE TYPE provider_type AS ENUM ('ATM', 'BANK_BRANCH', 'ONLINE_BANKING');

CREATE TABLE transaction (
    id SERIAL NOT NULL,
    accountNumber VARCHAR(20),
    transactionId VARCHAR(32),
    transactionType transaction_type,
    provider provider_type,
    country VARCHAR(2),
    currency VARCHAR(6),
    amount NUMERIC(22,6),
    dateTime TIMESTAMP,
    timezone VARCHAR(50),
    description VARCHAR(500),
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    creationUser VARCHAR(30),
    modifiedAt TIMESTAMP,
    modificationUser VARCHAR(30),
    PRIMARY KEY(id)
);

CREATE INDEX IF NOT EXISTS accountNumber_idx ON transaction (accountNumber);
CREATE INDEX IF NOT EXISTS transactionId_idx ON transaction (transactionId);
