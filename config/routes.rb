Rails.application.routes.draw do
  resources :classrooms
  resources :user_roles
  resources :roles
  resources :users
  resources :profile_pictures
  resources :relationships
  resources :relationship_types
  resources :person_attributes
  resources :person_attribute_types
  resources :person_names
  resources :people
  resources :genders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
