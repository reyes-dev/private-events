Rails.application.routes.draw do
  root "events#index"
  devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_scope :user do
    get 'show', to: 'users/sessions#show'
  end
  resources :events do
    post 'attend', on: :member
    post 'stop_attend', on: :member
    get 'future_events', on: :collection
    get 'past_events', on: :collection
  end
  resources :events
end