class CreateFilters < ActiveRecord::Migration[5.2]
  def change
    create_table :filters do |t|
      t.string :name
      t.belongs_to :category, foreign_key: { to_table: :categories }
      t.timestamps
    end
  end
end
