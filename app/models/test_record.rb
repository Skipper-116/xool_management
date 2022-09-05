class TestRecord < VoidableRecord
  belongs_to :classroom
  belongs_to :cohort_term
  belongs_to :subject
  belongs_to :person
end
