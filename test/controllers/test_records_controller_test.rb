require 'test_helper'

class TestRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test_record = test_records(:one)
  end

  test "should get index" do
    get test_records_url, as: :json
    assert_response :success
  end

  test "should create test_record" do
    assert_difference('TestRecord.count') do
      post test_records_url, params: { test_record: { classroom_id: @test_record.classroom_id, cohort_term_id: @test_record.cohort_term_id, content: @test_record.content, end_date: @test_record.end_date, other_resources: @test_record.other_resources, person_id: @test_record.person_id, results_available: @test_record.results_available, start_date: @test_record.start_date, subject_id: @test_record.subject_id, title: @test_record.title } }, as: :json
    end

    assert_response 201
  end

  test "should show test_record" do
    get test_record_url(@test_record), as: :json
    assert_response :success
  end

  test "should update test_record" do
    patch test_record_url(@test_record), params: { test_record: { classroom_id: @test_record.classroom_id, cohort_term_id: @test_record.cohort_term_id, content: @test_record.content, end_date: @test_record.end_date, other_resources: @test_record.other_resources, person_id: @test_record.person_id, results_available: @test_record.results_available, start_date: @test_record.start_date, subject_id: @test_record.subject_id, title: @test_record.title } }, as: :json
    assert_response 200
  end

  test "should destroy test_record" do
    assert_difference('TestRecord.count', -1) do
      delete test_record_url(@test_record), as: :json
    end

    assert_response 204
  end
end
