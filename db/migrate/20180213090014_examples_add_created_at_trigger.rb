class ExamplesAddCreatedAtTrigger < ActiveRecord::Migration[5.1]
  def change
  end
  execute %{
 DROP TRIGGER IF EXISTS `examples_created_at`
  }
  execute %{
 CREATE TRIGGER examples_created_at BEFORE INSERT ON examples
   FOR EACH ROW
     thisTrigger: BEGIN                                                                                
     IF ((@TRIGGER_CHECKS = FALSE)                                                                   
      OR (@TRIGGER_BEFORE_INSERT_CHECKS = FALSE))                                                    
     THEN                                                                                         
       LEAVE thisTrigger;                                                                         
     END IF;   

     SET NEW.created_at = NOW();
   END
  }
end
