class AddWonderTypeIdToWonders < ActiveRecord::Migration
  def change
    add_column :wonders, :type_id, :integer
  end
end
