class CreateExamples < ActiveRecord::Migration[5.1]
  def change
    create_table :examples do |t|
      t.string :name, :default => ''

      #t.datetime :created_at, :default => 'now()' 
      #t.datetime :updated_at, :default => 'now()'
      #t.timestamps, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :created_at, :default => -> { 'CURRENT_TIMESTAMP' }
      t.datetime :updated_at, :default => -> { 'CURRENT_TIMESTAMP' }
      
    end
    execute "alter table examples change column updated_at updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;"
  end
end
