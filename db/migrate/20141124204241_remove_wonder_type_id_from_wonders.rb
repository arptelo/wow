class RemoveWonderTypeIdFromWonders < ActiveRecord::Migration
  def change
  	remove_column :wonders, :wonder_type_id, :integer
  end
end
