require 'test_helper'

class TeacherSubjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teacher_subject = teacher_subjects(:one)
  end

  test "should get index" do
    get teacher_subjects_url, as: :json
    assert_response :success
  end

  test "should create teacher_subject" do
    assert_difference('TeacherSubject.count') do
      post teacher_subjects_url, params: { teacher_subject: { person_id: @teacher_subject.person_id, subject_id: @teacher_subject.subject_id } }, as: :json
    end

    assert_response 201
  end

  test "should show teacher_subject" do
    get teacher_subject_url(@teacher_subject), as: :json
    assert_response :success
  end

  test "should update teacher_subject" do
    patch teacher_subject_url(@teacher_subject), params: { teacher_subject: { person_id: @teacher_subject.person_id, subject_id: @teacher_subject.subject_id } }, as: :json
    assert_response 200
  end

  test "should destroy teacher_subject" do
    assert_difference('TeacherSubject.count', -1) do
      delete teacher_subject_url(@teacher_subject), as: :json
    end

    assert_response 204
  end
end
