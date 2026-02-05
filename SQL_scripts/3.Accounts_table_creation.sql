CREATE TABLE ACCOUNTS (
    account_id NUMBER PRIMARY KEY,
    customer_id NUMBER NOT NULL,
    account_type VARCHAR2(20) NOT NULL,
    open_date DATE DEFAULT SYSDATE,
    CONSTRAINT fk_customer
        FOREIGN KEY (customer_id)
        REFERENCES CUSTOMERS(customer_id)
);
