class AddPriceToItems < ActiveRecord::Migration[5.2]
  def change
    change_table :items do |t|
      t.integer :daily_price
    end
  end
end
