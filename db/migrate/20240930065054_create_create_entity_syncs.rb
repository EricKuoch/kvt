class CreateCreateEntitySyncs < ActiveRecord::Migration[7.1]
  def change
    create_table :entity_syncs do |t|
      t.string :entity, null: false
      t.references :establishment, null: false
      t.boolean :enable, default: false, null: false
      t.string :mapper_name
      t.string :establishment_helper
      t.string :conversion_hash_method, null: true
      t.string :folder_path, null:true
      t.string :csv_name, null:true
      t.boolean :headers, null:true
      t.string :col_sep, null:true
      t.string :encoding, null:true
      t.timestamps
    end
  end
end
