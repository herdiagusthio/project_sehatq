class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :user_id, null: false
      t.string :patient_name, null: false
      t.string :email, null: false
      t.string :phone_number, null: false
      t.datetime :birthdate, null: false
      t.integer :work_detail_id, null: false

      t.timestamps
    end
  end
end
