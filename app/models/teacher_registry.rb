class TeacherRegistry < ApplicationRecord
  belongs_to :cohort
  belongs_to :person
end
