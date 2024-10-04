class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.references :work_day, null: false, foreign_key: true
      t.references :transaction_type, null: false, foreign_key: true
      t.string :payment_type
      t.float :amount


      t.timestamps
    end
  end
end
