class CreateItemFilters < ActiveRecord::Migration[5.2]
  def change
    create_table :item_filters, id: false do |t|
      t.belongs_to :item, index: true, foreign_key: { to_table: :items }
      t.belongs_to :filter_value, index: true, foreign_key: { to_table: :filter_values }
      t.timestamps
    end
  end
end
