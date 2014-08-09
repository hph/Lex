Rails.application.routes.draw do
  root to: 'search#home', as: 'home'

  get '/chapters',     to: 'chapters#index', as: 'chapters'
  get '/chapters/:id', to: 'chapters#show',  as: 'show_chapter'

  get '/laws/:id', to: 'laws#show', as: 'show_law'

  devise_for :users
end
