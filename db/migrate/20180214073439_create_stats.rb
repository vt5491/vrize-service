class CreateStats < ActiveRecord::Migration[5.1]
  def change
    create_table :stats do |t|
      t.belongs_to :example, index: true, foreign_key: "example_id"
      t.integer :likes, :default => 0
      t.float :avg_rating
      t.integer :impressions, :default => 0
      t.integer :clicks, :default => 0
      t.integer :code_views, :default => 0
      t.datetime :created_at, :default => -> { 'CURRENT_TIMESTAMP' }
      t.timestamp :updated_at, :default => -> { 'CURRENT_TIMESTAMP'  }
    end
    execute "alter table stats change column updated_at updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;"
  end
end
