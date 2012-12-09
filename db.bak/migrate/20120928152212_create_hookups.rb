class CreateHookups < ActiveRecord::Migration
  def change
    create_table :hookups do |t|
      t.datetime :date
      t.string :person_a_id
      t.string :person_b_id
      t.timestamps
    end
  end
end
