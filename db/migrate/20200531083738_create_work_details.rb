class CreateWorkDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :work_details do |t|
      t.integer :doctor_id
      t.integer :hospital_id
      t.string :day
      t.time :start_work_time
      t.time :end_work_time

      t.timestamps
    end
  end
end
