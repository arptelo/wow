class RemoveTypeFromWonder < ActiveRecord::Migration
  def change
    remove_column :wonders, :type, :string
  end
end
