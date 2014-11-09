class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.decimal :score
      t.references :user, index: true
      t.references :wonder, index: true

      t.timestamps
    end
    add_index :ratings, [:user_id, :created_at]
  end
end
