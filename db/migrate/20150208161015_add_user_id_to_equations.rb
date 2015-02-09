class AddUserIdToEquations < ActiveRecord::Migration
  def change
    add_column :equations, :user_id, :integer
  end
end
