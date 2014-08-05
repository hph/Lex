Rails.application.routes.draw do
  root            to: 'laws#index', as: 'home'
  get '/law/:id', to: 'laws#show',  as: 'law'
end
