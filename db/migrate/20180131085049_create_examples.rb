class CreateExamples < ActiveRecord::Migration[5.1]
  def change
    create_table :examples do |t|
      t.string :name, :default => ''
      t.string :category, :default => ''
      t.string :keyword_1, :default => ''
      t.string :keyword_2, :default => ''
      t.boolean :lifted, :default => 0
      t.integer :lift_failure_id, :default => 0
      # mysql 5.7 doesn't allow zero dates by default in var 'sql_mode'
      # t.datetime :lifted_at, :default => '0000-00-00 00:00:00'
      # t.datetime :lifted_at, :default => 0.0
      t.datetime :lifted_at

      # t.datetime :created_at, :default => 0
      t.datetime :created_at, :default => -> { 'CURRENT_TIMESTAMP' }
      t.timestamp :updated_at, :default => -> { 'CURRENT_TIMESTAMP' }
    end
    execute "alter table examples change column updated_at updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;"

    # create_table :stats do |t|
    #   t.belongs_to :example, index: { unique: true }, foreign_key: true
    #   # t.belongs_to :example, index: true
    #   t.integer :likes
    #   t.float :avg_rating
    #   t.integer :impressions
    #   t.integer :clicks
    #   t.integer :code_views
    #   t.datetime :created_at, :default => 0
    #   t.timestamp :updated_at, :default => -> { 'CURRENT_TIMESTAMP'  }
    # end
    # execute "alter table stats change column updated_at updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;"
  end
end
