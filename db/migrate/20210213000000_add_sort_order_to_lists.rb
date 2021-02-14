class AddSortOrderToLists < ActiveRecord::Migration[6.1]
    def change
      add_column :lists, :sort_order, :integer
  
    end
  end
  