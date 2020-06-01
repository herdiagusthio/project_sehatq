require 'ffaker'

Hospital.destroy_all

12.times {
	x = [true, false].sample
	Hospital.find_or_create_by(
		name: "RS #{FFaker::NameID.unique.name}", 
		profile: FFaker::HealthcareIpsum.sentences, 
		location: FFaker::AddressID.city, 
		address: FFaker::AddressID.street, 
		operational_time: "Senin - Minggu 09:00 - 21:00",
		note: x ? "Gawat Darurat 24 Jam" : nil,
		phone_number: FFaker::PhoneNumberID.phone_number,
		image: FFaker::Image.url
	)
}