class ExamplesAddLiftedTrigger < ActiveRecord::Migration[5.1]
  def change
  end
  execute %{
 CREATE TRIGGER lifted_trigger BEFORE UPDATE ON examples
   FOR EACH ROW
   BEGIN
     IF NEW.lifted = 1 && OLD.lifted = 0 THEN
       SET NEW.lifted_at = now();     
     ELSEIF NEW.lifted = 0 && OLD.lifted =1 THEN
       SET NEW.lifted_at = NULL;
     END IF;
   END
  }
end
