class DoctorsController < ApplicationController
	def doctors
  		@doctors = Doctor.page(params[:page]).per(5)
  	end

  	def detail_doctor
  		@data = Doctor.find_by(slug: params[:slug])

  		flash[:error] = 'Data tidak ditemukan' and redirect_to doctors_path if @data.blank?
  	end
end
