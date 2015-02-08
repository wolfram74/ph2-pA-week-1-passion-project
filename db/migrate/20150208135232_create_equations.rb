class CreateEquations < ActiveRecord::Migration
  def change
    create_table :equations do |t|
      t.string :label
      t.string :description
      t.string :latex_string
      t.string :private
      t.timestamps
    end
  end
end
