Rails.application.routes.draw do
  root 'personels#index' # to change main page / to a specific controller's view
  resources :personels do
    resources :players
  end
end
