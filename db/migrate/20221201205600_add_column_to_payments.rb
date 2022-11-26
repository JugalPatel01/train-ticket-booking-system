class AddColumnToPayments < ActiveRecord::Migration[7.0]
  def change
    remove_column :payments, :ticket_id
    add_column :payments, :ticket_id,:integer, null: false
  end
end
