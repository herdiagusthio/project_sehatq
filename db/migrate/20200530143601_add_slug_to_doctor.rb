class AddSlugToDoctor < ActiveRecord::Migration[6.0]
  def change
    add_column :doctors, :slug, :string
    add_index :doctors, :slug, unique: true
    add_column :hospitals, :slug, :string
    add_index :hospitals, :slug, unique: true
  end
end
