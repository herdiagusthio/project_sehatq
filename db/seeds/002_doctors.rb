require 'ffaker'

Doctor.destroy_all

list_role = ["Dokter Umum", "Dokter Gigi", "Dokter Mata", "Dokter Kandungan", "Dokter Kulit"]
list_hospital_id = Hospital.all.pluck(:id)
20.times {
	Doctor.find_or_create_by!(
		name: "dr. #{FFaker::NameID.unique.name}",
		profile: FFaker::HealthcareIpsum.sentences, 
		role: list_role[rand(list_role.length)], 
		hospital_id: list_hospital_id[rand(list_role.length)], 
		image: FFaker::Avatar.image
	)
}
	