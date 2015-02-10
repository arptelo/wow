class RenameRouteToTravel < ActiveRecord::Migration
  def change
    rename_table :routes, :travels
  end
end
