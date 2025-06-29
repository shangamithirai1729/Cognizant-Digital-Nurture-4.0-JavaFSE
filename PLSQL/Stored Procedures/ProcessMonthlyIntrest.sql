CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest IS
BEGIN
  UPDATE ACCOUNTS
  SET Balance = Balance + (Balance * 0.01)
  WHERE AccountType = 'SAVINGS';

  COMMIT;
END;

