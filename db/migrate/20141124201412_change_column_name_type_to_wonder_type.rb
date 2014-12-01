class ChangeColumnNameTypeToWonderType < ActiveRecord::Migration
  def change
  	rename_column :wonders, :type_id, :wonder_type_id
  end
end
