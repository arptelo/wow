class AddTypeToWonders < ActiveRecord::Migration
  def change
    add_column :wonders, :type, :string
  end
end
