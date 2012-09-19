class AddDeptToPennClass < ActiveRecord::Migration
  def change
    add_column :penn_classes, :dept, :string

  end
end
