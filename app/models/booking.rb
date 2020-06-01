class Booking < ApplicationRecord
	belongs_to :work_detail
	validates :user_id, presence: true
    validates :patient_name, presence: true
    validates :email, presence: true
    validates :phone_number, presence: true
    validates :birthdate, presence: true
    validates :booking_date, presence: true
    validates :work_detail_id, presence: true

end
