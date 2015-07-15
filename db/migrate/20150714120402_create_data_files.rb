class CreateDataFiles < ActiveRecord::Migration
  def change
    create_table :data_files do |t|
      t.string :name, null: false
      t.string :category
      t.text :description
      t.string :user_id
      t.string :csv_file

      t.timestamps null: false
    end
  end
end
