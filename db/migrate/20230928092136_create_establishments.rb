class CreateEstablishments < ActiveRecord::Migration[7.1]
  def change
    create_table :establishments do |t|
      t.string :name
      t.string :address
      t.integer :phone

      t.timestamps
    end
  end
end
