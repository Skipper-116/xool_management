# frozen_string_literal: true

require 'swagger_helper'
TAG = 'Classroom Facilities'
# rubocop:disable Metrics/BlockLength
RSpec.describe 'Classroom Facilities API', type: :request do
  # before all tests create a classroom
  before(:all) do
    @classroom = Classroom.create(name: 'Classroom 1', description: 'Classroom 1', space: 10)
    @classroom_facility = ClassroomFacility.create(name: 'Classroom Facility 1', description: 'Classroom Facility 1',
                                                   quantity: 10, classroom_id: @classroom.id)
  end
  path '/api/v1/classroom_facilities' do
    get('list classroom_facilities') do
      tags TAG
      consumes 'application/json'
      produces 'application/json'
      response(200, 'successful') do
        schema type: :array, items: { '$ref' => '#/components/schemas/classroom_facility' }
        run_test!
      end
    end

    post('create classroom facility i.e desks') do
      tags TAG
      consumes 'application/json'
      produces 'application/json'
      parameter name: :classroom_facility, in: :body, schema: { '$ref' => '#/components/schemas/classroom_facility' }
      response(201, 'successful') do
        schema '$ref' => '#/components/schemas/classroom_facility'

        let(:classroom_facility) do
          { name: 'Classroom Facility', description: 'Classroom Facility Description', quantity: 1,
            classroom_id: @classroom.id }
        end
        run_test!
      end

      response(422, 'invalid request') do
        schema '$ref' => '#/components/schemas/common_error'
        let(:classroom_facility) do
          { name: 'Classroom Facility', description: 'Classroom Facility Description', quantity: -1, classroom_id: -1 }
        end
        run_test!
      end
    end
  end

  path '/api/v1/classroom_facilities/{id}' do
    get('show classroom_facility') do
      tags TAG
      consumes 'application/json'
      produces 'application/json'
      parameter name: 'id', in: :path, type: :string, description: 'id'
      response(200, 'successful') do
        schema '$ref' => '#/components/schemas/classroom_facility'

        let(:id) { @classroom_facility.id }
        run_test!
      end
      response 404, 'not found' do
        schema '$ref' => '#/components/schemas/common_error'
        let(:id) { 'invalid' }
        run_test!
      end
    end

    put('update classroom_facility') do
      tags TAG
      consumes 'application/json'
      produces 'application/json'
      parameter name: 'id', in: :path, type: :string, description: 'id'
      parameter name: :classroom_facility, in: :body, schema: { '$ref' => '#/components/schemas/classroom_facility' }
      response(200, 'successful') do
        let(:id) { @classroom_facility.id }
        let(:classroom_facility) do
          { name: 'Classroom Facility', description: 'Classroom Facility Description', quantity: 1, classroom_id: @classroom.id }
        end

        run_test!
      end
      response 422, 'invalid request' do
        schema '$ref' => '#/components/schemas/common_error'

        let(:id) { @classroom_facility.id }
        let(:classroom_facility) do
          { name: 'Classroom Facility', description: 'Classroom Facility Description', quantity: -1, classroom_id: -1 }
        end

        run_test!
      end
    end

    delete('delete classroom_facility') do
      tags TAG
      consumes 'application/json'
      produces 'application/json'
      parameter name: 'id', in: :path, type: :string, description: 'id'
      response(200, 'successful') do
        schema '$ref' => '#/components/schemas/common_response'
        let(:id) { @classroom_facility.id }
        run_test!
      end
      response 404, 'not found' do
        schema '$ref' => '#/components/schemas/common_error'

        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
