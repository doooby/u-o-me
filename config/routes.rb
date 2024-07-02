Rails.application.routes.draw do

  def scoped_controller name, &block
    scope name, controller: name, as: name, &block
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root "public#index"

  get 'uzivatel' => 'session#show', as: :session
  get 'faktura/:slug' => 'public#invoice', as: nil
  get 'faktury' => 'invoices#index', as: nil

  scope :session, controller: :session, as: :session do
    get :show
    post :create
    post :destroy
  end

  resources :users
  resources :invoices

end
