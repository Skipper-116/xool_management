Rails.application.routes.draw do
  resources :person_attribute_types
  resources :person_names
  resources :people
  resources :genders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
