class CreateHookups < ActiveRecord::Migration
  def change
    create_table :hookups do |t|
      t.datetime :date
      t.string :partnera
      t.string :partnerb

      t.timestamps
    end
  end
end
