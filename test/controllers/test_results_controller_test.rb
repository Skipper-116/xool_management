# frozen_string_literal: true

require 'test_helper'

class TestResultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test_result = test_results(:one)
  end

  test 'should get index' do
    get test_results_url, as: :json
    assert_response :success
  end

  test 'should create test_result' do
    assert_difference('TestResult.count') do
      post test_results_url,
           params: { test_result: { TestRecord_id: @test_result.TestRecord_id, grade: @test_result.grade, person_id: @test_result.person_id } }, as: :json
    end

    assert_response 201
  end

  test 'should show test_result' do
    get test_result_url(@test_result), as: :json
    assert_response :success
  end

  test 'should update test_result' do
    patch test_result_url(@test_result),
          params: { test_result: { TestRecord_id: @test_result.TestRecord_id, grade: @test_result.grade, person_id: @test_result.person_id } }, as: :json
    assert_response 200
  end

  test 'should destroy test_result' do
    assert_difference('TestResult.count', -1) do
      delete test_result_url(@test_result), as: :json
    end

    assert_response 204
  end
end
