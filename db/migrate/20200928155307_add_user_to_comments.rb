class AddUserToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :user, :string
  end
end
