class ExamplesAddLiftScore < ActiveRecord::Migration[5.1]
  def change
    add_column :examples, :lift_score, :integer, :after => :liftable, :default => 0
  end
end
