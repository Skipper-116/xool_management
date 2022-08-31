require 'test_helper'

class ClassroomTeachersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @classroom_teacher = classroom_teachers(:one)
  end

  test "should get index" do
    get classroom_teachers_url, as: :json
    assert_response :success
  end

  test "should create classroom_teacher" do
    assert_difference('ClassroomTeacher.count') do
      post classroom_teachers_url, params: { classroom_teacher: { classroom_id: @classroom_teacher.classroom_id, cohort_term_id: @classroom_teacher.cohort_term_id, person_id: @classroom_teacher.person_id } }, as: :json
    end

    assert_response 201
  end

  test "should show classroom_teacher" do
    get classroom_teacher_url(@classroom_teacher), as: :json
    assert_response :success
  end

  test "should update classroom_teacher" do
    patch classroom_teacher_url(@classroom_teacher), params: { classroom_teacher: { classroom_id: @classroom_teacher.classroom_id, cohort_term_id: @classroom_teacher.cohort_term_id, person_id: @classroom_teacher.person_id } }, as: :json
    assert_response 200
  end

  test "should destroy classroom_teacher" do
    assert_difference('ClassroomTeacher.count', -1) do
      delete classroom_teacher_url(@classroom_teacher), as: :json
    end

    assert_response 204
  end
end
