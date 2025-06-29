CREATE OR REPLACE PROCEDURE TransferFunds(
  from_account IN NUMBER,
  to_account IN NUMBER,
  amount IN NUMBER
) IS
  insufficient_funds EXCEPTION;
  current_balance NUMBER;
BEGIN
  SELECT Balance INTO current_balance FROM ACCOUNTS WHERE AccountID = from_account FOR UPDATE;

  IF current_balance < amount THEN
    RAISE insufficient_funds;
  END IF;

  UPDATE ACCOUNTS
  SET Balance = Balance - amount
  WHERE AccountID = from_account;

  UPDATE ACCOUNTS
  SET Balance = Balance + amount
  WHERE AccountID = to_account;

  COMMIT;

EXCEPTION
  WHEN insufficient_funds THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Transfer failed: Insufficient balance.');
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Transfer failed: ' || SQLERRM);
END;
/
