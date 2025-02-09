# frozen_string_literal: true

# Route for the API
# rubocop:disable Metrics/BlockLength
Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/'
  mount Rswag::Api::Engine => '/'
  namespace :api do
    namespace :v1 do
      resources :input_types
      resources :test_results
      resources :test_records
      resources :test_types
      resources :teacher_subjects
      resources :subjects
      resources :teacher_registries
      resources :student_registries
      resources :classroom_teachers
      resources :classroom_students
      resources :cohort_terms
      resources :cohorts
      resources :classroom_facilities
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
      post '/auth/login' => 'authentication#login'
    end
  end
end
# rubocop:enable Metrics/BlockLength
