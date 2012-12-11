class AddWearToPerson < ActiveRecord::Migration
  def change
    add_column :hookups, :weara, :string
    add_column :hookups, :wearb, :string
  end
end
