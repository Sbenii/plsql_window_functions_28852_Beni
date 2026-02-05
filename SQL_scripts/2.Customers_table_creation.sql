CREATE TABLE CUSTOMERS (
    customer_id NUMBER PRIMARY KEY,
    full_name VARCHAR2(100) NOT NULL,
    registration_date DATE DEFAULT SYSDATE,
    branch_id NUMBER NOT NULL,
    CONSTRAINT fk_branch
        FOREIGN KEY (branch_id)
        REFERENCES BRANCHES(branch_id)
);