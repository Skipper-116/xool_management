# frozen_string_literal: true

class TestResult < VoidableRecord
  belongs_to :test_record
  belongs_to :person
end
