# frozen_string_literal: true

require 'swagger_helper'

TAG = 'Classroom Students'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'Classroom Student Endpoints', type: :request do
  # before all tests create a classroom
  before(:all) do
    # rails drop database and create database
    DatabaseCleaner.clean_with(:truncation)
    Rails.application.load_seed
  end

  let(:classroom) { create :classroom }
  let(:cohort) { create :cohort }
  let(:cohort_term) { create :cohort_term, cohort: }
  let(:person) { create :person }
  let(:test_classroom_student) { create :classroom_student, classroom:, cohort_term:, person: }
  let(:person_two) { create :person }

  path '/api/v1/classroom_students' do
    get('list classroom_students') do
      tags TAG
      consumes 'application/json'
      produces 'application/json'

      response(200, 'successful') do
        schema type: :array, items: { '$ref' => '#/components/schemas/classroom_student' }
        run_test!
      end
    end

    post('create classroom_student') do
      tags TAG
      consumes 'application/json'
      produces 'application/json'
      parameter name: :classroom_student, in: :body, schema: { '$ref' => '#/components/schemas/classroom_student' }
      response(201, 'successful') do
        schema '$ref' => '#/components/schemas/classroom_student'

        let(:classroom_student) { create :classroom_student, classroom:, cohort_term:, person: person_two }
        run_test!
      end

      response 422, 'invalid request' do
        schema '$ref' => '#/components/schemas/common_error'
        let(:classroom_student) do
          { classroom_id: -1, cohort_term_id: -1, person_id: -1 }
        end
        run_test!
      end
    end
  end

  path '/api/v1/classroom_students/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show classroom_student') do
      tags TAG
      produces 'application/json'

      response(200, 'successful') do
        schema '$ref' => '#/components/schemas/classroom_student'

        let(:id) { test_classroom_student.id }
        run_test!
      end
    end

    put('update classroom_student') do
      tags TAG
      consumes 'application/json'
      produces 'application/json'
      parameter name: :classroom_student, in: :body, schema: { '$ref' => '#/components/schemas/classroom_student' }
      response(200, 'successful') do
        schema '$ref' => '#/components/schemas/classroom_student'

        let(:id) { test_classroom_student.id }
        let(:classroom_student) { { person_id: person_two.id } }
        run_test!
      end
    end

    delete('delete classroom_student') do
      response(200, 'successful') do
        schema '$ref' => '#/components/schemas/common_response'
        let(:id) { test_classroom_student.id }
        run_test!
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
