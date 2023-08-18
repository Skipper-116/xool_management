# frozen_string_literal: true

class TeacherRegistry < VoidableRecord
  belongs_to :cohort
  belongs_to :person
end
