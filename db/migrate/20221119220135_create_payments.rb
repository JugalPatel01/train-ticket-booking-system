class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.integer :pay_id
      t.string :type
      t.string :status

      t.timestamps
    end
  end
end
