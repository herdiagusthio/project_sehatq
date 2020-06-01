class ApplicationController < ActionController::Base

	def redirect_func(error, msg, url)
		type = error ? :error : :notice
		flash[type] = msg	
		redirect_to url
	end
end
