class CreatePropertyTags < ActiveRecord::Migration
  def change
    create_table :property_tags do |t|
      t.string :name

      t.timestamps
    end
  end
end
