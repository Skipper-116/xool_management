# frozen_string_literal: true

require 'swagger_helper'

TAG = 'People'

RSpec.describe 'People Management', type: :request do
  describe 'Person API' do
    path '/api/v1/people' do
      # parameter name: :Authorization, in: :header, type: :string, required: true
      get('list people') do
        tags TAG
        produces 'application/json'
        response(200, 'people found') do
          schema type: :array, items: { '$ref' => '#/components/schemas/person' }
          let(:Authorization) { AuthHelper.http_login }
          run_test!
        end
      end

      post('create person') do
        tags TAG
        consumes 'application/json'
        produces 'application/json'
        parameter name: :person, in: :body, schema: { '$ref' => '#/components/schemas/person' }

        response(201, 'successful') do
          let(:person) { { birthdate: '2019-01-01', gender_id: Gender.first.id, birthdate_estimated: true } }
          let(:Authorization) { AuthHelper.http_login }
          run_test!
        end

        response(422, 'invalid request') do
          schema '$ref' => '#/components/schemas/common_error'
          let(:Authorization) { AuthHelper.http_login }
          let(:person) { { birthdate: '2019-01-01' } }
          run_test!
        end
      end
    end

    path '/api/v1/people/{id}' do
      # parameter name: :Authorization, in: :header, type: :string, required: true
      get('show person') do
        tags TAG
        produces 'application/json'
        parameter name: 'id', in: :path, type: :string

        response(200, 'person found') do
          schema '$ref' => '#/components/schemas/person'

          let(:Authorization) { AuthHelper.http_login }
          let(:id) { Person.create!(birthdate: '2022-09-01'.to_date, gender_id: 1, birthdate_estimated: 0).id }
          run_test!
        end

        response(404, 'not found') do
          schema '$ref' => '#/components/schemas/common_error'
          let(:id) { 'invalid' }
          let(:Authorization) { AuthHelper.http_login }
          run_test!
        end
      end

      put('update person') do
        tags TAG
        consumes 'application/json'
        produces 'application/json'
        parameter name: 'id', in: :path, type: :string
        parameter name: :person, in: :body, schema: { '$ref' => '#/components/schemas/person' }

        person = Person.create!(birthdate: '2022-09-01'.to_date, gender_id: 1, birthdate_estimated: 0)
        response(200, 'successful') do
          let(:Authorization) { AuthHelper.http_login }
          let(:id) { person.id }
          let(:person) { { birthdate: '1991-01-01', gender_id: 2, birthdate_estimated: 1 } }

          after do |example|
            example.metadata[:response][:content] = {
              'application/json' => {
                example: JSON.parse(response.body, symbolize_names: true)
              }
            }
          end
          run_test!
        end

        response(422, 'invalid request') do
          schema '$ref' => '#/components/schemas/common_error'
          let(:Authorization) { AuthHelper.http_login }
          let(:id) { person.id }
          let(:person) { { birthdate: '2023-09-01'.to_date, gender_id: 1, birthdate_estimated: 0 } }
          run_test!
        end

        response(404, 'not found') do
          schema '$ref' => '#/components/schemas/common_error'
          let(:Authorization) { AuthHelper.http_login }
          let(:id) { 'invalid' }
          let(:person) { { birthdate: '1991-01-01' } }
        end
      end

      delete('delete person') do
        tags TAG
        produces 'application/json'
        parameter name: 'id', in: :path, type: :string

        person = Person.create!(birthdate: '2022-09-01'.to_date, gender_id: 1, birthdate_estimated: 0)
        response(200, 'successful') do
          let(:Authorization) { AuthHelper.http_login }
          let(:id) { person.id }
          run_test!
        end

        response(404, 'not found') do
          schema '$ref' => '#/components/schemas/common_error'
          let(:Authorization) { AuthHelper.http_login }
          let(:id) { 'invalid' }
          run_test!
        end
      end
    end
  end
end
