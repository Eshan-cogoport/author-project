Rails.application.routes.draw do
  get "/authors", to:"author#index"
  post "/authors", to:"author#create"
  put "/authors/:id", to:"author#update"
  delete "/authors/:id", to:"author#delete"

  get "/books" ,to:"books#index"
  # get "/books/", to:"books#index"
  post "/books", to:"books#create"
  put "/books/:id", to:"books#update"
  delete "/books/:id", to:"books#delete"
end
