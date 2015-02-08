class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer :equation_id
      t.integer :sheet_id
      t.timestamps
    end
  end
end
