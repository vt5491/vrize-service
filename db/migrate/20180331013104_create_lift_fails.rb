class CreateLiftFails < ActiveRecord::Migration[5.1]
  def change
    create_table :lift_fails do |t|
      t.references :example, foreign_key: true
      t.string :note, :default => ''
      t.datetime :created_at, :default => -> { 'CURRENT_TIMESTAMP' }
      t.timestamp :updated_at, :default => -> { 'CURRENT_TIMESTAMP' }

      #t.timestamps
    end
    execute "alter table lift_fails change column updated_at updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;"
  end
end
