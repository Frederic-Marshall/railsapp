class AddCategoryIdToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :category_id, :integer
    add_index :questions, :category_id
  end
end
