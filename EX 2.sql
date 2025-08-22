CREATE TABLE my_employee1 (
    id        NUMBER(4),
    last_name VARCHAR(25),
    first_name VARCHAR(25),
    user_id   VARCHAR(25),
    salary    NUMBER(9,2)
);

INSERT ALL
    INTO my_employee1 VALUES (1, 'Patel',   'Ralph',  'rpatel',   895)
    INTO my_employee1 VALUES (2, 'Dancs',   'Betty',  'rbdancs',  860)
    INTO my_employee1 VALUES (3, 'Biri',    'Ben',    'bbiri',    1100)
    INTO my_employee1 VALUES (4, 'Newman',  'Chad',   'bCnewman', 750)
    INTO my_employee1 VALUES (5, 'Ropebur', 'Audrey', 'aropebur', 1550)
SELECT * FROM dual;


SELECT * FROM my_employee1;

INSERT INTO my_employee1
VALUES (
    3,
    'biri',
    'ben',
    LOWER(SUBSTR('ben', 1, 1) || SUBSTR('biri', 1, 7)),
    1100
);

INSERT INTO my_employee1
VALUES (
    4,
    'Newman',
    'Chad',
    LOWER(SUBSTR('Chad', 1, 1) || SUBSTR('Newman', 1, 7)),
    750
);

COMMIT;

UPDATE my_employee1
SET last_name = 'brener'
WHERE id = 3;

UPDATE my_employee1
SET salary = 1000
WHERE salary < 900;
