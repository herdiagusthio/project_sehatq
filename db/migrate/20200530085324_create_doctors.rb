class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.text :profile
      t.string :role

      t.timestamps null: false
    end
  end
end
