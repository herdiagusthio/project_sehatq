class AddImageToDoctor < ActiveRecord::Migration[6.0]
  def change
    add_column :doctors, :image, :string, after: :role
    add_column :doctors, :hospital_id, :integer, after: :role
    add_column :hospitals, :image, :string, after: :phone_number
  end
end
