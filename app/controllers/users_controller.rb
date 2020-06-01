class UsersController < ApplicationController
	CheckResult = Struct.new(:valid?, :message, :redirect_path)
	skip_before_action  :verify_authenticity_token, only: [:create_booking]
	def booking
		redirect_to new_user_session_path and return unless current_user 
		redirect_to "/dokter" and return if params[:wdi].blank?

		work_detail = WorkDetail.where("id = ?", params[:wdi])
		redirect_func(true, "Data Invalid!", "/dokter") and return if work_detail.blank?
		
		@disabled_day = get_disable_days(work_detail.first.day.downcase)


		@booking_data = Booking.new
	end

	def create_booking		
		redirect_to new_user_session_path and return unless current_user

		checking = validate_create_booking(params[:work_detail_id], params[:booking_date])

		unless checking.valid?
			redirect_func(true, checking.message, checking.redirect_path) and return
		end


		params[:user_id] = current_user.id
		
		@booking_data = Booking.new(booking_params)
		if @booking_data.save
			flash[:notice] = "Booking berhasil"
			redirect_to "/list-booking" and return
		else 
			flash[:error] = @booking_data.errors.full_messages[0]
			redirect_to "/booking?wdi=#{params[:work_detail_id]}"
		end
	end

	def list_booking
		@booking_data = Booking.where("booking_date >= ?", Date.today).order(:booking_date).page(params[:page]).per(10)
	end

	private

	def validate_create_booking(work_detail_id, booking_date)
		# validate work detail data is exist
		work_detail = WorkDetail.where("id = ?", work_detail_id)
		return CheckResult.new(false, "Data Invalid!", "/dokter") if work_detail.blank?

		# validate booking date is valid
		booking_date = booking_date.to_date
		today = Date.today
		return CheckResult.new(false, "Tanggal booking harus lebih besar dari tanggal hari ini", "/booking?wdi=#{work_detail_id}") if booking_date < today
		
		work_detail = work_detail.first 

		# validate A total of 10 users can book the same doctor
		total_booking = Booking.where("work_detail_id = ? AND booking_date = ?", work_detail.id, booking_date ).count
		return CheckResult.new(false, "Kapasitas booking untuk dokter #{work_detail.doctor.name} sudah penuh", "/dokter") if total_booking >= 10
		
		# validate maximum booking time 30 minute before doctor schedule
		now = Time.now
		doctor_start_work_time = DateTime.new(
			booking_date.strftime("%Y").to_i, booking_date.strftime("%m").to_i, 
			booking_date.strftime("%d").to_i,work_detail.start_work_time.strftime("%H").to_i,
			work_detail.start_work_time.strftime("%M").to_i, 0, "+07:00"
			)
		return CheckResult.new(false, "Waktu booking #{work_detail.doctor.name} sudah habis", "/booking?wdi=#{work_detail_id}") if now >= doctor_start_work_time - 30.minutes

		return CheckResult.new(true, nil, nil)
	end

	def get_disable_days(work_day)
		day = ["minggu", "senin", "selasa", "rabu", "kamis", "jumat", "sabtu"]
		full_day_index = [0,1,2,3,4,5,6]
		work_day_index = day.index(work_day.downcase)
		disabled_day = full_day_index.delete(work_day_index)
		return full_day_index
	end

	def booking_params
		accessible = [:user_id, :patient_name, :email, :phone_number, :birthdate, :booking_date, :work_detail_id]
		params.permit(accessible)
	end
end
