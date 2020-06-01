class DoctorsController < ApplicationController
	def doctors
  		@doctors = Doctor.page(params[:page]).per(5)
  	end

  	def detail_doctor
  		@data = Doctor.find_by(slug: params[:slug])
  		redirect_func(true, "Data tidak ditemukan", action: "doctors") and return if @data.blank?

  		@work_detail = WorkDetail.where(doctor_id: @data.id)
  	end
end
