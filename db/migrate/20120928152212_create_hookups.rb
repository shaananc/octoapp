class CreateHookups < ActiveRecord::Migration
  def change
    create_table :hookups do |t|
      t.datetime :date
      t.string :partnera
      t.string :partnerb
      t.string :person_id

      t.timestamps
    end
  end
end
