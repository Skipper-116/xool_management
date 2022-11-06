# frozen_string_literal: true

require 'swagger_helper'

TAG = 'Classroom Students'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'Classroom Student Endpoints', type: :request do
  let(:classroom) { create :classroom, space: 2 }
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
        let(:Authorization) { AuthHelper.http_login }
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

        let(:classroom_student) do 
          { classroom_id: classroom.id, cohort_term_id: cohort_term.id, person_id: person.id }
        end
        let(:Authorization) { AuthHelper.http_login }
        run_test!
      end

      response 404, 'invalid request' do
        description 'If the specified resource is not found, a 404 error is returned.'
        schema '$ref' => '#/components/schemas/common_error'
        let(:classroom_student) do
          { classroom_id: -1, cohort_term_id: -1, person_id: -1 }
        end
        let(:Authorization) { AuthHelper.http_login }

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
        let(:Authorization) { AuthHelper.http_login }
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
        let(:Authorization) { AuthHelper.http_login }
        run_test!
      end
    end

    delete('delete classroom_student') do
      tags TAG
      produces 'application/json'
      response(200, 'successful') do
        schema '$ref' => '#/components/schemas/common_response'
        let(:id) { test_classroom_student.id }
        let(:Authorization) { AuthHelper.http_login }
        run_test!
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
