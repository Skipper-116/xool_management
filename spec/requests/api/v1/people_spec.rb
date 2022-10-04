require 'swagger_helper'

TAG = 'People'.freeze

RSpec.describe 'People Management', type: :request do
  # before load seed data
  before(:all) do
    Rails.application.load_seed
  end

  describe 'Person API' do
    path '/api/v1/people' do
      get('list people') do
        tags TAG
        produces 'application/json'
        response(200, 'people found') do
          schema type: :array, items: {
            type: :object, properties: {
              id: { type: :integer },
              birthdate: { type: :string },
              gender_id: { type: :integer },
              bithdate_estimated: { type: :boolean, nullable: true },
              created_at: { type: :string },
              updated_at: { type: :string }
            }
          }
          run_test!
        end
      end

      post('create person') do
        tags TAG
        consumes 'application/json'
        produces 'application/json'
        parameter name: :person, in: :body, schema: {
          type: :object, properties: {
            birthdate: { type: :string },
            gender_id: { type: :integer },
            bithdate_estimated: { type: :boolean }
          },
          required: %w[birthdate gender_id bithdate_estimated]
        }

        response(201, 'successful') do
          let(:person) { { birthdate: '2019-01-01', gender_id: 1, bithdate_estimated: true } }
          run_test!
        end

        response(422, 'invalid request') do
          let(:person) { { birthdate: '2019-01-01' } }
          run_test!
        end
      end
    end

    path '/api/v1/people/{id}' do
      get('show person') do
        tags TAG
        produces 'application/json'
        parameter name: 'id', in: :path, type: :string

        response(200, 'person found') do
          schema type: :object, properties: {
            id: { type: :integer },
            birthdate: { type: :string },
            gender_id: { type: :integer },
            bithdate_estimated: { type: :boolean, nullable: true },
            voided: { type: :boolean },
            void_reason: { type: :string, nullable: true },
            date_voided: { type: :string, nullable: true },
            created_at: { type: :string },
            updated_at: { type: :string }
          }, required: %w[id birthdate gender_id bithdate_estimated voided created_at updated_at]

          let(:id) { Person.create!(birthdate: '2022-09-01'.to_date, gender_id: 1, bithdate_estimated: 0).id }
          run_test!
        end

        response(404, 'not found') do
          let(:id) { 'invalid' }
          run_test!
        end
      end

      put('update person') do
        tags TAG
        consumes 'application/json'
        produces 'application/json'
        parameter name: 'id', in: :path, type: :string
        parameter name: :person, in: :body, schema: {
          type: :object, properties: {
            birthdate: { type: :string },
            gender_id: { type: :integer },
            bithdate_estimated: { type: :boolean }
          }, required: %w[birthdate gender_id bithdate_estimated]
        }

        person = Person.create!(birthdate: '2022-09-01'.to_date, gender_id: 1, bithdate_estimated: 0)
        response(200, 'successful') do
          let(:id) { person.id }
          let(:person) { { birthdate: '1991-01-01', gender_id: 2, bithdate_estimated: 1 } }

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
          let(:id) { person.id }
          let(:person) { { birthdate: '2023-09-01'.to_date, gender_id: 1, bithdate_estimated: 0 } }
          run_test!
        end

        response(404, 'not found') do
          let(:id) { 'invalid' }
          let(:person) { { birthdate: '1991-01-01' } }
        end
      end

      delete('delete person') do
        tags TAG
        produces 'application/json'
        parameter name: 'id', in: :path, type: :string

        person = Person.create!(birthdate: '2022-09-01'.to_date, gender_id: 1, bithdate_estimated: 0)
        response(200, 'successful') do
          let(:id) { person.id }
          run_test!
        end

        response(404, 'not found') do
          let(:id) { 'invalid' }
          run_test!
        end
      end
    end
  end
end
