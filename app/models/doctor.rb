class Doctor < ApplicationRecord
	extend FriendlyId
  	friendly_id :name, use: :slugged
	belongs_to  :hospital
end
