class CreateStats < ActiveRecord::Migration[5.1]
  def change
    create_table :stats do |t|
      t.belongs_to :example, index: true
      t.integer :likes
      t.float :avg_rating
      t.integer :impressions
      t.integer :clicks
      t.integer :code_views
      t.datetime :created_at, :default => -> { 'CURRENT_TIMESTAMP' }
      t.timestamp :updated_at, :default => -> { 'CURRENT_TIMESTAMP'  }
    end
    execute "alter table stats change column updated_at updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;"
  end
end
