Rails.application.routes.draw do
  root "events#index"
  devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_scope :user do
    get 'show', to: 'users/sessions#show'
  end
  resources :events, only: [:new, :create, :index, :show]
  resources :events do
    post 'attend', on: :member
    post 'stop_attend', on: :member
  end
end
