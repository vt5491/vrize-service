class ExamplesRemovePathCol < ActiveRecord::Migration[5.1]
  def change
    remove_column :examples, :path
    Example.reset_column_information
  end
end
