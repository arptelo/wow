class AddWonderTypeRefToWonders < ActiveRecord::Migration
  def change
    add_reference :wonders, :wonder_type, index: true
  end
end
