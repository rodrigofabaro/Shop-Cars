ActionController::Routing::Routes.draw do |map|

	map.root :controller => "home"

  map.namespace :admin do |admin|
    admin.resources :cars do |image|
      image.resources :images
    end

    admin.resources :users
    admin.resource :account, :controller => "users"
    admin.resources :active_users
    admin.resources :password_resets
    admin.resources :user_sessions

    admin.login "login", :controller => "user_sessions", :action => "new"
    admin.logout "logout", :controller => "user_sessions", :action => "destroy"
    admin.root :controller=>"user_sessions",:action=>"new"
  end


  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

