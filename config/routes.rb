Rails.application.routes.draw do
  resources :sessions do
    resources :blocks, except: [:index, :show] do
      resources :exercises, except: [:index, :show]
    end
  end
end
