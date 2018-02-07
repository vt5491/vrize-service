class ExamplesAddKeywordCols < ActiveRecord::Migration[5.1]
  def change
    add_column :examples, :keyword_1, :string, :after => :category
    add_column :examples, :keyword_2, :string, :after => :keyword_1
  end
end
