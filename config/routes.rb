Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get 'new', to: 'questions#new', as: :new
post 'score', to: 'questions#score', as: :score
get 'score', to: redirect("/new")
end
