Rails.application.routes.draw do
  root to: 'submissions#index'

  resources :submissions
end
