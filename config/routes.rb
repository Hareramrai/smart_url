Rails.application.routes.draw do
  resources :short_urls
  #root 'short_urls#show/:id'
  get '/:key', to: 'short_urls#visit', as: :visit

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
