class CreateWonders < ActiveRecord::Migration
  def change
    create_table :wonders do |t|
      t.string :name
      t.decimal :lat
      t.decimal :lng
      t.integer :user_id

      t.timestamps
    end
    add_index :wonders, [:user_id, :created_at]
  end
end
