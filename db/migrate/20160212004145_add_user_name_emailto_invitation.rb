class AddUserNameEmailtoInvitation < ActiveRecord::Migration
  def change
  	add_column :invitations, :user_name, :string
  	add_column :invitations, :user_email, :string
  end
end
