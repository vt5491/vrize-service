class StatsCreatedAtTrigger < ActiveRecord::Migration[5.1]
  def change
  end
  execute %{
 DROP TRIGGER IF EXISTS `stats_created_at`
  }
  execute %{
 CREATE TRIGGER stats_created_at BEFORE INSERT ON stats
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
