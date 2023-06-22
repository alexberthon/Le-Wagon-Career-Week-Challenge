Rails.application.routes.draw do
  resources :listings, only: %i[index show create update destroy]
  resources :missions, only: %i[index]
end
