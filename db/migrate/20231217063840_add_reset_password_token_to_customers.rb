class AddResetPasswordTokenToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :reset_password_token, :string
    add_index :customers, :reset_password_token, unique: true
  end
end
