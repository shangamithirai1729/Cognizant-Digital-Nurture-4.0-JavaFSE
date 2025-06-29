CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(
  dept_id IN NUMBER,
  bonus_percent IN NUMBER
) IS
BEGIN
  UPDATE EMPLOYEES
  SET Salary = Salary + (Salary * bonus_percent / 100)
  WHERE DepartmentID = dept_id;

  COMMIT;
END;
/
