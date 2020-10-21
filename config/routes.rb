Rails.application.routes.draw do
  resources :games, only: %i(index)

  resources :players, only: [] do
    resources :achievements, only: %i(show create)
  end
end
