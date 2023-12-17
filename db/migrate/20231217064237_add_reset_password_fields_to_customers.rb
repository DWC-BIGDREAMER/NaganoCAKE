class AddResetPasswordFieldsToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :reset_password_sent_at, :datetime
    add_column :customers, :remember_created_at, :datetime
  end
end
