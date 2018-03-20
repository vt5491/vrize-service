class CreateExampleLiftReqs < ActiveRecord::Migration[5.1]
  def change
    create_table :example_lift_reqs do |t|
      t.references :example, foreign_key: true
      t.integer :lift_failure_code, :default => 0
      t.datetime :created_at, :default => -> { 'CURRENT_TIMESTAMP' }
      t.timestamp :updated_at, :default => -> { 'CURRENT_TIMESTAMP' }

      #t.timestamps
    end
    execute "alter table example_lift_reqs change column updated_at updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;"
  end
end
