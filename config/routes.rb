Rails.application.routes.draw do
  resources :costs_managements
  post '/change_graph', to: 'costs_managements#change_graph'
end
