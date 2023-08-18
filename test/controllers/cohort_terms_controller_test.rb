# frozen_string_literal: true

require 'test_helper'

class CohortTermsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cohort_term = cohort_terms(:one)
  end

  test 'should get index' do
    get cohort_terms_url, as: :json
    assert_response :success
  end

  test 'should create cohort_term' do
    assert_difference('CohortTerm.count') do
      post cohort_terms_url,
           params: { cohort_term: { cohort_id: @cohort_term.cohort_id, end_date: @cohort_term.end_date, name: @cohort_term.name, start_date: @cohort_term.start_date } }, as: :json
    end

    assert_response 201
  end

  test 'should show cohort_term' do
    get cohort_term_url(@cohort_term), as: :json
    assert_response :success
  end

  test 'should update cohort_term' do
    patch cohort_term_url(@cohort_term),
          params: { cohort_term: { cohort_id: @cohort_term.cohort_id, end_date: @cohort_term.end_date, name: @cohort_term.name, start_date: @cohort_term.start_date } }, as: :json
    assert_response 200
  end

  test 'should destroy cohort_term' do
    assert_difference('CohortTerm.count', -1) do
      delete cohort_term_url(@cohort_term), as: :json
    end

    assert_response 204
  end
end
