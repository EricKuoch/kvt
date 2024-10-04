class CreateWorkDays < ActiveRecord::Migration[7.1]
  def change
    create_table :work_days do |t|
      t.date :date
      t.float :total, null:true
      t.boolean :closed_shop

      t.timestamps
    end
  end
end
