Rails.application.routes.draw do
  	devise_for :users
  	root to: 'pages#home'
  	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  	namespace :doctors, path: '/dokter' do
  		get "/", action: :doctors
  		get "/:slug", action: :detail_doctor
	end
end
