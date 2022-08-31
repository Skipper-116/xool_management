require 'test_helper'

class StudentRegistriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_registry = student_registries(:one)
  end

  test "should get index" do
    get student_registries_url, as: :json
    assert_response :success
  end

  test "should create student_registry" do
    assert_difference('StudentRegistry.count') do
      post student_registries_url, params: { student_registry: { absent_reason: @student_registry.absent_reason, captured_by: @student_registry.captured_by, classroom_id: @student_registry.classroom_id, cohort_term_id: @student_registry.cohort_term_id, person_id: @student_registry.person_id, present: @student_registry.present } }, as: :json
    end

    assert_response 201
  end

  test "should show student_registry" do
    get student_registry_url(@student_registry), as: :json
    assert_response :success
  end

  test "should update student_registry" do
    patch student_registry_url(@student_registry), params: { student_registry: { absent_reason: @student_registry.absent_reason, captured_by: @student_registry.captured_by, classroom_id: @student_registry.classroom_id, cohort_term_id: @student_registry.cohort_term_id, person_id: @student_registry.person_id, present: @student_registry.present } }, as: :json
    assert_response 200
  end

  test "should destroy student_registry" do
    assert_difference('StudentRegistry.count', -1) do
      delete student_registry_url(@student_registry), as: :json
    end

    assert_response 204
  end
end
