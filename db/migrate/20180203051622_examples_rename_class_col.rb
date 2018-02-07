class ExamplesRenameClassCol < ActiveRecord::Migration[5.1]
  def change
    rename_column :examples, :class, :category
  end
end
