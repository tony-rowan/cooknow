Rails.application.routes.draw do
  root "searches#new"

  resource :search, only: %i(create show destroy)
end
