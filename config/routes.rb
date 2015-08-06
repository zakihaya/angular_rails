Rails.application.routes.draw do
  root 'templates#index'

  get '/dashboard' => 'templates#index'
  get '/todo_lists/:id' => 'templates#index'
  get '/templates/:path.html' => 'templates#template', constariants: { path: /.+/ }

  namespace :api, defaults: { format: :json } do
    resources :todo_lists, only: [:index, :show, :create, :destroy] do
      resources :todos, except: [:new, :edit, :show]
    end
  end
end
