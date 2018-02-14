class ExamplesAddLiftedTrigger < ActiveRecord::Migration[5.1]
  def change
  end
  execute %{
  DROP TRIGGER IF EXISTS `examples_lifted_at`
  }

  execute %{ 
 CREATE TRIGGER lifted_trigger BEFORE UPDATE ON examples
   FOR EACH ROW
   thisTrigger: BEGIN
     IF ((@TRIGGER_CHECKS = FALSE)
       OR (@TRIGGER_BEFORE_INSERT_CHECKS = FALSE))
         THEN
           LEAVE thisTrigger;
     END IF;
     IF NEW.lifted = 1 && OLD.lifted = 0 THEN
       SET NEW.lifted_at = now();     
     ELSEIF NEW.lifted = 0 && OLD.lifted =1 THEN
       SET NEW.lifted_at = NULL;
     END IF;
   END
  }
end
