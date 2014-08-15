Rails.application.routes.draw do

  root to: 'sessions#new'

  resources :users
  resource :session

  namespace :api, defaults: { format: :json } do
    resources :users
  end

  get '/about', :to => 'static_pages#about', as: :about_page
  get '/contact', :to => 'static_pages#contact', as: :contact_page

end
