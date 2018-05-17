class ExamplesAddImg < ActiveRecord::Migration[5.1]
  def change
    add_column :examples, :img, :string, :after => :lift_code, :default => ''
  end
end
