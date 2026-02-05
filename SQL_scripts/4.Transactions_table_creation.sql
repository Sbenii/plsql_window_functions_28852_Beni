CREATE TABLE TRANSACTIONS (
    transaction_id NUMBER PRIMARY KEY,
    account_id NUMBER NOT NULL,
    transaction_date DATE DEFAULT SYSDATE,
    amount NUMBER(12,2) NOT NULL,
    channel_type VARCHAR2(10) CHECK (channel_type IN ('ONLINE', 'BRANCH')),
    CONSTRAINT fk_account
        FOREIGN KEY (account_id)
        REFERENCES ACCOUNTS(account_id)
);
