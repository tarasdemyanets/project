class CreateFilterValues < ActiveRecord::Migration[5.2]
  def change
    create_table :filter_values do |t|
      t.string :name
      t.belongs_to :filter, foreign_key: { to_table: :filters }
      t.timestamps
    end
  end
end
