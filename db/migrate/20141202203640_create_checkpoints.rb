class CreateCheckpoints < ActiveRecord::Migration
  def change
    create_table :checkpoints do |t|
      t.string :name
      t.decimal :lat
      t.decimal :lng
      t.references :route, index: true
      t.integer :order
      t.references :wonder, index: true
      t.string :content

      t.timestamps
    end
    add_index :checkpoints, [:route_id, :wonder_id]
  end
end
