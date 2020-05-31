class Hospital < ApplicationRecord
	extend FriendlyId
  	friendly_id :name, use: :slugged
	has_many :doctors
end
