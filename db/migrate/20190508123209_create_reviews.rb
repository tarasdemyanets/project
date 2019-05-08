class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :review_text
      t.references :reviewable, polymorphic: true, index: true
      t.belongs_to :reviewer, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
