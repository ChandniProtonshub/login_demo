Rails.application.routes.draw do
	get 'users/new'
	get 'users/login'
	
	get 'users/signup'
	get 'welcome/index'
	post 'users/users_login'
	root 'welcome#index'
	resources :users
	get 'logout', to: 'users#logout'
	# match ':controller(/:action(/:id))(.:format)'
	
	# match ':controller(/:action(/:id))(.:format)'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
