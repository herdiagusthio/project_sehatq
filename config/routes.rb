Rails.application.routes.draw do
  	devise_for :users, controllers: { registrations: "users/registrations" }
  	root to: 'hospitals#hospitals'
  	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  	
  	#Routes for doctors_controller.rb
  	namespace :doctors, path: '/dokter' do
  		get "/", action: :doctors
  		get "/:slug", action: :detail_doctor
	end

	#Routes for hospitals_controller.rb
	namespace :hospitals, path: '/rumah-sakit' do
		get "/", action: :hospitals
		get "/:slug", action: :detail_hospital
	end

end
