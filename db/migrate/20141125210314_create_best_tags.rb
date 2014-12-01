class CreateBestTags < ActiveRecord::Migration
  def change
    create_table :best_tags do |t|
      t.references :wonder_type, index: true
      t.references :property_tag, index: true

      t.timestamps
    end
  end
end
