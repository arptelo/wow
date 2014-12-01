class RemoveWonderIdFromComments < ActiveRecord::Migration
  def change
  	remove_column :comments, :wonder_id, :integer
  end
end
