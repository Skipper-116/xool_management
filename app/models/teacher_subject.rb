# frozen_string_literal: true

class TeacherSubject < VoidableRecord
  belongs_to :person
  belongs_to :subject
end
