Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/books", to: "books#index"

  get "/authors/:id", to: "authors#show"

end
