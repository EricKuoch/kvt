class AddEstablishmentToWorkDay < ActiveRecord::Migration[7.1]
  def change
    add_reference :work_days, :establishment, null: false, foreign_key: true
  end
end
