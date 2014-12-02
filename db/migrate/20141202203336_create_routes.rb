class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :name
      t.integer :user_id
      t.text :content

      t.timestamps
    end
    add_index :routes, [:user_id, :created_at]
  end
end
