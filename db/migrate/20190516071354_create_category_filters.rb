class CreateCategoryFilters < ActiveRecord::Migration[5.2]
  def change
    create_table :categories_filters do |t|
      t.belongs_to :filter, index: true, foreign_key: { to_table: :filters }
      t.belongs_to :category, index: true, foreign_key: { to_table: :categories }
      t.timestamps
    end
  end
end
