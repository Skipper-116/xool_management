require 'swagger_helper'

TAG = 'Authentication'.freeze

RSpec.describe 'Authentication Management', type: :request do
  # before all tests
  before(:all) do
    Rails.application.load_seed
  end

  path '/api/v1/auth/login' do
    post('login authentication') do
      tags TAG
      consumes 'application/json'
      produces 'application/json'
      parameter name: :authentication, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string },
          password: { type: :string }
        },
        required: %w[username password]
      }

      response(200, 'successful') do
        schema type: :object,
               properties: {
                 auth_token: { type: :string }
               },
               required: %w[auth_token]

        let(:authentication) { { username: 'superuser', password: 'password' } }
        run_test!
      end

      response(401, 'unauthorized') do
        schema type: :object,
               properties: {
                 message: { type: :string }
               },
               required: %w[message]

        let(:authentication) { { username: 'superuser', password: 'wrong_password' } }
        run_test!
      end
    end
  end
end
