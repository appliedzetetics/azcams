Pccn::Application.routes.draw do
  resources :answers

  resources :questions

  resources :questionnaires

  resources :triggers

  resources :trigger_types

  get "print_jobs/index"

	# :id represents the media type
	
  get "print_jobs/download"

  resources :print_queues

  resources :print_templates

  resources :ideas

  resources :activities

  resources :episode_contacts

  resources :contact_actions

  resources :contact_types

  resources :appointment_statuses

  resources :file_nos

	resources :print_jobs do
		member do
	  	get 'download/:media_type', :action => 'download', :as => 'download'
	  end
  end
#  namespace :admin do resources :users end

  resources :messages

  resources :templates

#  root :to => "public/index.html"
# 	root :to => "welcome#index.html"

  resources :absence_slots

  resources :absences

  resources :accounts

  resources :episode_statuses

  devise_for :users, :skip => :static

  unauthenticated :user do
  	root :to => "static#welcome"
  end
  
  authenticated :user do
  	root :to => "static#status"
  end

  resources :appointments do
    member do
	  	post 'updatestatus/:id', :action => 'updatestatus', :as => 'updatestatus'

		end    
  end

	resources :slot_dates do
	  collection do
      get :calendar
      get :dailyplanner
		end
		member do
      post :book
      post :rebook
    end
	end

  resources :allocations do
		member do
			get 'templatelist'
		end
	end
	 	 
  resources :assessments

  resources :temporary_imports

  resources :episodes

  resources :episodes do
    get :autocomplete_client_surname, :on => :collection
    get :close, :on => :member
  end

  resources :clients do
    collection do
      get :myclients
    end
  end

  resources :slots

  resources :clinics

  resources :practitioners

  resources :practitioner_types
  resources :allocation_types

  resources :venues

#  scope "/admin" do
    resources :users
#  end

  get "client/autocomplete_surname"

  match ':action' => 'static#:action'

#  get "home/index"
#  root :controller => 'static', :action => '/'


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
