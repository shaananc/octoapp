class CreateHookups < ActiveRecord::Migration
  def change
    create_table :hookups do |t|
      t.integer :person_a_id
      t.integer :person_b_id
      t.string :url
      t.timestamps
      
    end
  end
end
