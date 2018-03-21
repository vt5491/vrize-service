class ExamplesAddLiftableCol < ActiveRecord::Migration[5.1]
  def change
    add_column :examples, :liftable, :boolean, :after => :keyword_2, :null => true
  end
end
