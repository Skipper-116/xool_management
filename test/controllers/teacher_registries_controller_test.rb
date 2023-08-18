# frozen_string_literal: true

require 'test_helper'

class TeacherRegistriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teacher_registry = teacher_registries(:one)
  end

  test 'should get index' do
    get teacher_registries_url, as: :json
    assert_response :success
  end

  test 'should create teacher_registry' do
    assert_difference('TeacherRegistry.count') do
      post teacher_registries_url,
           params: { teacher_registry: { absent_reason: @teacher_registry.absent_reason, captured_by: @teacher_registry.captured_by, cohort_id: @teacher_registry.cohort_id, person_id: @teacher_registry.person_id, present: @teacher_registry.present } }, as: :json
    end

    assert_response 201
  end

  test 'should show teacher_registry' do
    get teacher_registry_url(@teacher_registry), as: :json
    assert_response :success
  end

  test 'should update teacher_registry' do
    patch teacher_registry_url(@teacher_registry),
          params: { teacher_registry: { absent_reason: @teacher_registry.absent_reason, captured_by: @teacher_registry.captured_by, cohort_id: @teacher_registry.cohort_id, person_id: @teacher_registry.person_id, present: @teacher_registry.present } }, as: :json
    assert_response 200
  end

  test 'should destroy teacher_registry' do
    assert_difference('TeacherRegistry.count', -1) do
      delete teacher_registry_url(@teacher_registry), as: :json
    end

    assert_response 204
  end
end
