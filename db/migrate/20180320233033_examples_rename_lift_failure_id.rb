class ExamplesRenameLiftFailureId < ActiveRecord::Migration[5.1]
  def change
    rename_column :examples, :lift_failure_id, :lift_failure_code
  end
end
