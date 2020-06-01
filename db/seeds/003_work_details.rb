WorkDetail.destroy_all

doctors_id = Doctor.all

x = [1,2,3]
day = ["Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu", "Minggu"]

doctors_id.each do |doctor|
	fix_day = day.dup.shuffle
	x.sample.times {		
		WorkDetail.find_or_create_by!(
			doctor_id: doctor.id, 
			hospital_id: doctor.hospital_id, 
			day: fix_day[0], 
			start_work_time: "10:00:00", 
			end_work_time: "16:00:00",
		)
		b = fix_day.dup.tap{|i| i.delete_at(0)}
		fix_day = b
	}
end

