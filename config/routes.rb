Rails.application.routes.draw do
  resources :sessions do
    resources :blocks, except: [:index, :show]
  end
end
