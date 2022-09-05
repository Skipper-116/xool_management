class TeacherRegistry < VoidableRecord
  belongs_to :cohort
  belongs_to :person
end
