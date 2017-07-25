Rails.application.routes.draw do
  devise_for :users
	resources :badges do
		member do 
		  put "like",to: "badges#upvote"
		end
	end
	
	root "badges#index"
end
