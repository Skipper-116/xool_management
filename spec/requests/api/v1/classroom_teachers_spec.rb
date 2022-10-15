# frozen_string_literal: true

require 'swagger_helper'

TAG = 'Classroom Teachers'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'api/v1/classroom_teachers', type: :request do
  let(:classroom) { create :classroom }
  let(:cohort) { create :cohort }
  let(:cohort_term) { create :cohort_term, cohort: }
  let(:person) { create :person }
  let(:person_two) { create :person }
  let(:test_classroom_teacher) do
    create :classroom_teacher, classroom:, cohort_term:, person:
  end

  path '/api/v1/classroom_teachers' do
    get('list classroom_teachers') do
      tags TAG
      consumes 'application/json'
      produces 'application/json'
      response(200, 'successful') do
        schema type: :array, items: { '$ref' => '#/components/schemas/classroom_teacher' }
        run_test!
      end
    end

    post('create classroom_teacher') do
      tags TAG
      consumes 'application/json'
      produces 'application/json'
      parameter name: :classroom_teacher, in: :body, schema: { '$ref' => '#/components/schemas/classroom_teacher' }
      response(201, 'successful') do
        let(:classroom_teacher) do
          { classroom_id: classroom.id, cohort_term_id: cohort_term.id, person_id: person_two.id }
        end
        run_test!
      end

      response 422, 'invalid request' do
        schema '$ref' => '#/components/schemas/common_error'
        let(:classroom_teacher) do
          { classroom_id: -1, cohort_term_id: -1, person_id: -1 }
        end
        run_test!
      end
    end
  end

  path '/api/v1/classroom_teachers/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show classroom_teacher') do
      tags TAG
      produces 'application/json'

      response(200, 'successful') do
        schema '$ref' => '#/components/schemas/classroom_teacher'
        let(:id) { test_classroom_teacher.id }
        run_test!
      end

      response(404, 'not found') do
        schema '$ref' => '#/components/schemas/common_error'
        let(:id) { 'invalid' }
        run_test!
      end
    end

    put('update classroom_teacher') do
      tags TAG
      consumes 'application/json'
      produces 'application/json'
      parameter name: :classroom_teacher, in: :body, schema: { '$ref' => '#/components/schemas/classroom_teacher' }
      response(200, 'successful') do
        schema '$ref' => '#/components/schemas/classroom_teacher'

        let(:id) { test_classroom_teacher.id }
        let(:classroom_teacher) { { person_id: person_two.id } }

        run_test!
      end

      response(404, 'not found') do
        schema '$ref' => '#/components/schemas/common_error'
        let(:id) { 'invalid' }
        let(:classroom_teacher) { { person_id: person_two.id } }
        run_test!
      end

      response 422, 'invalid request' do
        schema '$ref' => '#/components/schemas/common_error'
        let(:id) { test_classroom_teacher.id }
        let(:classroom_teacher) { { person_id: -1 } }
        run_test!
      end
    end

    delete('delete classroom_teacher') do
      tags TAG
      produces 'application/json'
      parameter name: :void_reason, in: :query, type: :string, description: 'void reason'
      response(200, 'successful') do
        schema '$ref' => '#/components/schemas/common_response'
        let(:id) { test_classroom_teacher.id }
        let(:void_reason) { 'test' }
        run_test!
      end

      response(404, 'not found') do
        schema '$ref' => '#/components/schemas/common_error'
        let(:id) { 'invalid' }
        let(:void_reason) { 'test' }
        run_test!
      end

      response 400, 'bad request' do
        schema '$ref' => '#/components/schemas/common_error'
        let(:id) { test_classroom_teacher.id }
        let(:void_reason) { '' }
        run_test!
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
