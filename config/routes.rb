Rails.application.routes.draw do
  root 'calendars#index'
  # resources :calendars, only: [:index, :create] # 必要なアクションだけを指定
  resources :calendars
end
