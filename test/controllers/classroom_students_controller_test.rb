# frozen_string_literal: true

require 'test_helper'

class ClassroomStudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @classroom_student = classroom_students(:one)
  end

  test 'should get index' do
    get classroom_students_url, as: :json
    assert_response :success
  end

  test 'should create classroom_student' do
    assert_difference('ClassroomStudent.count') do
      post classroom_students_url,
           params: { classroom_student: { classroom_id: @classroom_student.classroom_id, cohort_term_id: @classroom_student.cohort_term_id, person_id: @classroom_student.person_id } }, as: :json
    end

    assert_response 201
  end

  test 'should show classroom_student' do
    get classroom_student_url(@classroom_student), as: :json
    assert_response :success
  end

  test 'should update classroom_student' do
    patch classroom_student_url(@classroom_student),
          params: { classroom_student: { classroom_id: @classroom_student.classroom_id, cohort_term_id: @classroom_student.cohort_term_id, person_id: @classroom_student.person_id } }, as: :json
    assert_response 200
  end

  test 'should destroy classroom_student' do
    assert_difference('ClassroomStudent.count', -1) do
      delete classroom_student_url(@classroom_student), as: :json
    end

    assert_response 204
  end
end
