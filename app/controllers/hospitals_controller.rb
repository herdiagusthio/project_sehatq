class HospitalsController < ApplicationController

	def hospitals
		@hospitals = Hospital.page(params[:page]).per(6)
	end

	def detail_hospital
		@data = Hospital.find_by(slug: params[:slug])

  		flash[:error] = 'Data tidak ditemukan' and redirect_to hospitals_path if @data.blank?
	end

end
