Rails.application.routes.draw do
 mount S3Relay::Engine => "/s3_relay"
	root "feeds#index"
	devise_for :users

	resources :friendships, only: [:index] do
		get :search, on: :collection
	end


	resources :bookmarks, only: [:index] 
	
	resources :feeds do 
		resources  :bookmarks, only: [:create, :destroy]
	end 

	resources :users do 
		resources  :friendships, only: [:create, :destroy]
	end

end
