class AddCategoryToItem < ActiveRecord::Migration[5.2]
  def change
    change_table :items do |t|
      t.belongs_to :category, foreign_key: { to_table: :categories }
    end
  end
end
