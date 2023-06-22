Rails.application.routes.draw do
  resources :listings, only: %i[index show create update delete]
  resources :missions, only: %i[index]
end
