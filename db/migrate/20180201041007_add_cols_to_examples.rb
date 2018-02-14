class AddColsToExamples < ActiveRecord::Migration[5.1]
  def change
    add_column :examples, :category, :string, :after => :name, :default => ''
    add_column :examples, :keyword_1, :string, :after => :category, :default => ''
    add_column :examples, :keyword_2, :string, :after => :keyword_1, :default => ''
    add_column :examples, :lifted, :boolean, :after => :keyword_2, :default => 0
    add_column :examples, :lift_failure_id, :integer, :after => :lifted, :default => 0
    #add_column :examples, :likes, :integer, :after => :lift_failure_id, :default => 0
    #add_column :examples, :avg_rating, :integer, :after => :likes
    add_column :examples, :lifted_at, :datetime, :after => :lift_failure_id
  end

end
