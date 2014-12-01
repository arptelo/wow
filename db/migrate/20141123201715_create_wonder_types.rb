class CreateWonderTypes < ActiveRecord::Migration
  def change
    create_table :wonder_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
