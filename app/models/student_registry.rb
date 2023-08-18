# frozen_string_literal: true

class StudentRegistry < VoidableRecord
  belongs_to :classroom
  belongs_to :cohort_term
  belongs_to :person
end
