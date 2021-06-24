Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'todos#index'
  post '/' => 'todos#create'
  delete '/:id' => 'todos#destroy'
  put '/:id' => 'todos#toggle'
  get '/:id' => 'todos#pre_edit'
  post '/:id' => 'todos#change'
end
