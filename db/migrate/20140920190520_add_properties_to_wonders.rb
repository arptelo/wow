class AddPropertiesToWonders < ActiveRecord::Migration
  def change
    add_column :wonders, :properties, :hstore
  end
end
