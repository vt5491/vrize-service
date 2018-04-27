class ExamplesLiftedFixup < ActiveRecord::Migration[5.1]
  def change
    remove_column :examples, :lifted
    remove_column :examples, :lifted_at
    rename_column :examples, :lift_failure_code, :lift_code
  end
  execute %{
    DROP TRIGGER IF EXISTS `examples_lifted_at_trigger`
  }
end
