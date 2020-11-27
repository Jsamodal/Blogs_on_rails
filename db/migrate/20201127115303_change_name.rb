class ChangeName < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :last_name, :string
    remove_column :users, :lastname, :string
  end
end
