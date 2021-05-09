Rails.application.routes.draw do
	namespace :api do
		resource :orders, only: :create
	end 
end
