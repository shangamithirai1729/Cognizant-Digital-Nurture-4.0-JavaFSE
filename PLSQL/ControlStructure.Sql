DECLARE
  CURSOR loan_due_cursor IS
    SELECT c.Name, l.LoanID, l.DueDate
    FROM LOANS l
    JOIN CUSTOMERS c ON l.CustomerID = c.CustomerID
    WHERE l.DueDate BETWEEN SYSDATE AND SYSDATE + 30;
BEGIN
  FOR rec1 IN (
    SELECT l.LoanID
    FROM LOANS l
    JOIN CUSTOMERS c ON l.CustomerID = c.CustomerID
    WHERE c.Age > 60
  ) LOOP
    UPDATE LOANS
    SET InterestRate = InterestRate - 1
    WHERE LoanID = rec1.LoanID;
  END LOOP;

  FOR rec2 IN (
    SELECT CustomerID FROM CUSTOMERS WHERE Balance > 10000
  ) LOOP
    UPDATE CUSTOMERS
    SET IsVIP = 'TRUE'
    WHERE CustomerID = rec2.CustomerID;
  END LOOP;

  FOR rec3 IN loan_due_cursor LOOP
    DBMS_OUTPUT.PUT_LINE('Reminder: Dear ' || rec3.Name ||
                         ', your loan (ID: ' || rec3.LoanID ||
                         ') is due on ' || TO_CHAR(rec3.DueDate, 'DD-MON-YYYY') || '.');
  END LOOP;

  COMMIT;
END;
