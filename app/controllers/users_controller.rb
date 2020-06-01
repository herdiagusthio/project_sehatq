class UsersController < ApplicationController
	def booking
		redirect_to new_user_session_path and return unless current_user 
		@booking_data = Booking.new
	end

	def create_booking
		booking_data = Booking.create(booking_params)
	end

	private

	def booking_params
		accessible = [:user_id, :patient_name, :email, :phone_number, :birtdate, :work_detail_id]
		params.permit(accessible)
	end
end
