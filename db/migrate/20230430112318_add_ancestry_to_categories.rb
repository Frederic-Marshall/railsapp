class AddAncestryToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :ancestry, :string
  end
end
