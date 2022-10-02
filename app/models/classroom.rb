class Classroom < VoidableRecord
  has_many :classroom_students
  has_many :students, through: :classroom_students, source: :person
end
