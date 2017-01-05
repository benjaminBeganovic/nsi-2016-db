TRIGGER LOG_COMPONENTDRAFT
AFTER DELETE OR INSERT OR UPDATE ON COMPONENTDRAFT
FOR EACH ROW

DECLARE
  log_action  Varchar2(1000);
  lv_user number;
BEGIN

   IF INSERTING THEN
    log_action := 'Insert';
  ELSIF UPDATING THEN
    log_action := 'Update';
  ELSIF DELETING THEN
    log_action := 'Delete';
  ELSE
    DBMS_OUTPUT.PUT_LINE('This code is not reachable.');
  END IF;


  INSERT INTO LOG (Created, Log_Text, User_Id)
  VALUES (SYSDATE, log_action, :new.userid);

END;


TRIGGER LOG_COMPONENT 
AFTER DELETE OR INSERT OR UPDATE ON COMPONENT
FOR EACH ROW

DECLARE
  log_action  Varchar2(1000);
  lv_user number;
BEGIN

   IF INSERTING THEN
    log_action := 'Insert';
  ELSIF UPDATING THEN
    log_action := 'Update';
  ELSIF DELETING THEN
    log_action := 'Delete';
  ELSE
    DBMS_OUTPUT.PUT_LINE('This code is not reachable.');
  END IF;


  INSERT INTO LOG (Created, Log_Text, User_Id)
  VALUES (SYSDATE, log_action, :new.userid);

END;
