class AddColsToExamples < ActiveRecord::Migration[5.1]
  def change
    add_column :examples, :class, :string, :after => :path 
    add_column :examples, :lifted, :boolean, :after => :class
    add_column :examples, :lift_failure_id, :integer, :after => :lifted
    add_column :examples, :likes, :integer, :after => :lift_failure_id
    add_column :examples, :avg_rating, :integer, :after => :likes
    add_column :examples, :lifted_at, :datetime, :after => :avg_rating
  end
end
