class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.integer :age
      t.string :building
      t.string :gender
      t.string :school

      t.timestamps
    end
  end
end
