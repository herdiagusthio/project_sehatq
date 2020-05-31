class CreateHospitals < ActiveRecord::Migration[6.0]
  	def change
	    create_table :hospitals do |t|
	      t.string :name
	      t.text :profile
	      t.string :location
	      t.string :address
	      t.string :operational_time
	      t.string :note
	      t.string :phone_number

	      t.timestamps null: false
	    end
  	end
end
