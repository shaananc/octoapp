class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :gender
      t.text :aboutme
      t.string :url
      t.boolean :admin
      t.timestamps
    end
  end
end
