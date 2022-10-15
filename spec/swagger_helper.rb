# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.swagger_root = Rails.root.join('swagger').to_s

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
  # be generated at the provided relative path under swagger_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a swagger_doc tag to the
  # the root example_group in your specs, e.g. describe '...', swagger_doc: 'v2/swagger.json'
  config.swagger_docs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'Maphunziro API',
        version: 'v1',
        description: 'This is the Maphunziro engine'
      },
      paths: {},
      components: {
        securitySchemes: {
          bearerAuth: {
            type: :http,
            scheme: :bearer,
            bearerFormat: :JWT
          }
        },
        schemas: {
          common_error: {
            type: :object,
            properties: {
              errors: {
                type: :array,
                items: {
                  type: :string
                }
              }
            }
          },
          common_response: {
            type: :object,
            properties: {
              message: { type: :string }
            }
          },
          classroom_facility: {
            type: :object,
            properties: {
              id: { type: :integer },
              name: { type: :string },
              description: { type: :string },
              quantity: { type: :number, format: :float },
              classroom_id: { type: :integer },
              created_at: { type: :string, format: :date_time },
              updated_at: { type: :string, format: :date_time }
            },
            required: %w[name description quantity classroom_id]
          },
          classroom_student: {
            type: :object,
            properties: {
              id: { type: :integer },
              classroom_id: { type: :integer },
              cohort_term_id: { type: :integer },
              person_id: { type: :integer },
              created_at: { type: :string, format: :date_time },
              updated_at: { type: :string, format: :date_time },
              classroom: { '$ref' => '#/components/schemas/classroom' },
              cohort: { '$ref' => '#/components/schemas/cohort' },
              person: { '$ref' => '#/components/schemas/person' }
            },
            required: %w[classroom_id cohort_term_id person_id]
          },
          classroom_teacher: {
            type: :object,
            properties: {
              id: { type: :integer },
              classroom_id: { type: :integer },
              person_id: { type: :integer },
              cohort_term_id: { type: :integer },
              created_at: { type: :string, format: :date_time },
              updated_at: { type: :string, format: :date_time },
              classroom: { '$ref' => '#/components/schemas/classroom' },
              person: { '$ref' => '#/components/schemas/person' },
              cohort_term: { '$ref' => '#/components/schemas/cohort_term' }
            },
            required: %w[classroom_id person_id cohort_term_id]
          },
          classroom: {
            type: :object,
            properties: {
              id: { type: :integer },
              name: { type: :string },
              description: { type: :string },
              space: { type: :number, format: :float },
              created_at: { type: :string, format: :date_time },
              updated_at: { type: :string, format: :date_time }
            },
            required: %w[name description space]
          },
          cohort_term: {
            type: :object,
            properties: {
              id: { type: :integer },
              name: { type: :string },
              start_date: { type: :string, format: :date },
              end_date: { type: :string, format: :date },
              cohort_id: { type: :integer },
              created_at: { type: :string, format: :date_time },
              updated_at: { type: :string, format: :date_time },
              cohort: { '$ref' => '#/components/schemas/cohort' }
            },
            required: %w[name start_date end_date cohort_id]
          },
          cohort: {
            type: :object,
            properties: {
              id: { type: :integer },
              name: { type: :string },
              short_name: { type: :string },
              description: { type: :string },
              start_date: { type: :string, format: :date },
              end_date: { type: :string, format: :date },
              created_at: { type: :string, format: :date_time },
              updated_at: { type: :string, format: :date_time }
            },
            required: %w[name short_name description start_date end_date]
          },
          gender: {
            type: :object,
            properties: {
              id: { type: :integer },
              name: { type: :string },
              description: { type: :string },
              created_at: { type: :string, format: :date_time },
              updated_at: { type: :string, format: :date_time }
            },
            required: %w[name description]
          },
          input_type: {
            type: :object,
            properties: {
              id: { type: :integer },
              name: { type: :string },
              pattern: { type: :string },
              created_at: { type: :string, format: :date_time },
              updated_at: { type: :string, format: :date_time }
            },
            required: %w[name pattern]
          },
          person: {
            type: :object,
            properties: {
              id: { type: :integer },
              birthdate: { type: :string },
              gender_id: { type: :integer },
              birthdate_estimated: { type: :boolean, nullable: true },
              voided: { type: :boolean },
              void_reason: { type: :string, nullable: true },
              date_voided: { type: :string, nullable: true },
              created_at: { type: :string, format: :date_time },
              updated_at: { type: :string, format: :date_time },
              gender: { '$ref' => '#/components/schemas/gender' }
            },
            required: %w[birthdate gender_id birthdate_estimated]
          },
          person_attribute_type: {
            type: :object,
            properties: {
              id: { type: :integer },
              name: { type: :string },
              description: { type: :string },
              is_required: { type: :boolean },
              input_types_id: { type: :integer },
              created_at: { type: :string, format: :date_time },
              updated_at: { type: :string, format: :date_time },
              input_type: { '$ref' => '#/components/schemas/input_type' }
            },
            required: %w[name description is_required input_types_id]
          },
          person_attribute: {
            type: :object,
            properties: {
              id: { type: :integer },
              attribute_value: { type: :string },
              person_id: { type: :integer },
              person_attribute_type_id: { type: :integer },
              created_at: { type: :string, format: :date_time },
              updated_at: { type: :string, format: :date_time },
              person: { '$ref' => '#/components/schemas/person' },
              person_attribute_type: { '$ref' => '#/components/schemas/person_attribute_type' }
            },
            required: %w[attribute_value person_id person_attribute_type_id]
          },
          person_name: {
            type: :object,
            properties: {
              id: { type: :integer },
              given_name: { type: :string },
              family_name: { type: :string },
              middle_name: { type: :string },
              maiden_name: { type: :string },
              person_id: { type: :integer },
              created_at: { type: :string, format: :date_time },
              updated_at: { type: :string, format: :date_time },
              person: { '$ref' => '#/components/schemas/person' }
            },
            required: %w[given_name family_name person_id]
          },
          profile_picture: {
            type: :object,
            properties: {
              id: { type: :integer },
              image_url: { type: :string },
              person_id: { type: :integer },
              created_at: { type: :string, format: :date_time },
              updated_at: { type: :string, format: :date_time },
              person: { '$ref' => '#/components/schemas/person' }
            },
            required: %w[image_url person_id]
          },
          relationship_type: {
            type: :object,
            properties: {
              id: { type: :integer },
              a_is_to_b: { type: :string },
              b_is_to_a: { type: :string },
              description: { type: :string },
              created_at: { type: :string, format: :date_time },
              updated_at: { type: :string, format: :date_time }
            },
            required: %w[a_is_to_b b_is_to_a description]
          },
          relationship: {
            type: :object,
            properties: {
              id: { type: :integer },
              person_a: { type: :integer },
              person_b: { type: :integer },
              relationship_type_id: { type: :integer },
              created_at: { type: :string, format: :date_time },
              updated_at: { type: :string, format: :date_time },
              relationship_type: { '$ref' => '#/components/schemas/relationship_type' },
              primary: { '$ref' => '#/components/schemas/person' },
              secondary: { '$ref' => '#/components/schemas/person' }
            },
            required: %w[person_a person_b relationship_type_id]
          },
          role: {
            type: :object,
            properties: {
              id: { type: :integer },
              name: { type: :string },
              description: { type: :string },
              created_at: { type: :string, format: :date_time },
              updated_at: { type: :string, format: :date_time }
            },
            required: %w[name description]
          },
          student_registry: {
            type: :object,
            properties: {
              id: { type: :integer },
              person_id: { type: :integer },
              classroom_id: { type: :integer },
              cohort_term_id: { type: :integer },
              captured_by: { type: :integer },
              present: { type: :boolean },
              absent_reason: { type: :string, nullable: true },
              obs_datetime: { type: :string, format: :date_time },
              created_at: { type: :string, format: :date_time },
              updated_at: { type: :string, format: :date_time },
              person: { '$ref' => '#/components/schemas/person' },
              classroom: { '$ref' => '#/components/schemas/classroom' },
              cohort_term: { '$ref' => '#/components/schemas/cohort_term' },
              captured_by_user: { '$ref' => '#/components/schemas/person' }
            },
            required: %w[person_id classroom_id cohort_term_id captured_by present obs_datetime]
          },
          subject: {
            type: :object,
            properties: {
              id: { type: :integer },
              name: { type: :string },
              description: { type: :string },
              created_at: { type: :string, format: :date_time },
              updated_at: { type: :string, format: :date_time }
            },
            required: %w[name description]
          },
          teacher_registry: {
            type: :object,
            properties: {
              id: { type: :integer },
              person_id: { type: :integer },
              cohort_id: { type: :integer },
              captured_by: { type: :integer },
              present: { type: :boolean },
              absent_reason: { type: :string, nullable: true },
              created_at: { type: :string, format: :date_time },
              updated_at: { type: :string, format: :date_time },
              person: { '$ref' => '#/components/schemas/person' },
              cohort: { '$ref' => '#/components/schemas/cohort' },
              captured_by_user: { '$ref' => '#/components/schemas/person' }
            },
            required: %w[person_id cohort_id captured_by present]
          },
          teacher_subject: {
            type: :object,
            properties: {
              id: { type: :integer },
              person_id: { type: :integer },
              subject_id: { type: :integer },
              created_at: { type: :string, format: :date_time },
              updated_at: { type: :string, format: :date_time },
              person: { '$ref' => '#/components/schemas/person' },
              subject: { '$ref' => '#/components/schemas/subject' }
            },
            required: %w[person_id subject_id]
          },
          test_record: {
            type: :object,
            properties: {
              id: { type: :integer },
              person_id: { type: :integer },
              classroom_id: { type: :integer },
              cohort_term_id: { type: :integer },
              subject_id: { type: :integer },
              title: { type: :string },
              content: { type: :string },
              other_resources: { type: :string },
              start_date: { type: :string, format: :date_time },
              end_date: { type: :string, format: :date_time },
              results_available: { type: :string, format: :date_time },
              created_at: { type: :string, format: :date_time },
              updated_at: { type: :string, format: :date_time },
              person: { '$ref' => '#/components/schemas/person' },
              classroom: { '$ref' => '#/components/schemas/classroom' },
              cohort_term: { '$ref' => '#/components/schemas/cohort_term' },
              subject: { '$ref' => '#/components/schemas/subject' }
            },
            required: %w[person_id classroom_id cohort_term_id subject_id title content start_date end_date
                         results_available]
          },
          test_result: {
            type: :object,
            properties: {
              id: { type: :integer },
              test_record_id: { type: :integer },
              person_id: { type: :integer },
              grade: { type: :number, format: :float },
              created_at: { type: :string, format: :date_time },
              updated_at: { type: :string, format: :date_time },
              test_record: { '$ref' => '#/components/schemas/test_record' },
              person: { '$ref' => '#/components/schemas/person' }
            },
            required: %w[test_record_id person_id grade]
          },
          test_type: {
            type: :object,
            properties: {
              id: { type: :integer },
              name: { type: :string },
              description: { type: :string },
              scale: { type: :number, format: :float },
              created_at: { type: :string, format: :date_time },
              updated_at: { type: :string, format: :date_time }
            },
            required: %w[name description scale]
          },
          user_role: {
            type: :object,
            properties: {
              id: { type: :integer },
              person_id: { type: :integer },
              role_id: { type: :integer },
              created_at: { type: :string, format: :date_time },
              updated_at: { type: :string, format: :date_time },
              person: { '$ref' => '#/components/schemas/person' },
              role: { '$ref' => '#/components/schemas/role' }
            },
            required: %w[person_id role_id]
          },
          login: {
            type: :object,
            properties: {
              username: { type: :string },
              password: { type: :string }
            },
            required: %w[username password]
          }
        }
      },
      # apply global security to all operations
      security: [bearerAuth: []],
      servers: [
        {
          url: '{defaultHost}',
          variables: {
            defaultHost: {
              default: 'http://localhost:3000'
            }
          }
        }
      ]
    }
  }

  # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
  # The swagger_docs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ':json' and ':yaml'.
  config.swagger_format = :yaml
end
