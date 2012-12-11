class CreateHookups < ActiveRecord::Migration
  def change
    create_table :hookups do |t|
      t.string :person_a_id
      t.string :person_b_id
      t.string :url
      t.timestamps
      
    end
  end
end
