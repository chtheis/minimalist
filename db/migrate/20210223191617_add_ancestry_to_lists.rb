class AddAncestryToLists < ActiveRecord::Migration[6.1]
  def change
    add_column :lists, :ancestry, :string
    add_index :lists, :ancestry
  end
end
