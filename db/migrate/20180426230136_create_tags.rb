class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.belongs_to :example, index: true, foreign_key: "example_id"
      t.string :tag, :null => false
      #t.timestamps
      t.datetime :created_at, :default => -> { 'CURRENT_TIMESTAMP' }
      t.timestamp :updated_at, :default => -> { 'CURRENT_TIMESTAMP'  }
    end
    execute "alter table tags change column updated_at updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;"
  end
end
