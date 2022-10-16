# frozen_string_literal: true

# Classroom Model
class Classroom < VoidableRecord
  after_void :void_associations
  has_many :classroom_students
  has_many :classroom_teachers
  has_many :classroom_facilities
  has_many :students, through: :classroom_students, source: :person
  has_many :teachers, through: :classroom_teachers, source: :person

  validates :name, :space, presence: true
  # space should always be a positive integer
  validates :space, numericality: { only_integer: true, greater_than: 0 }

  def void_associations(reason)
    classroom_students.each do |classroom_student|
      classroom_student.void(reason)
    end
    classroom_teachers.each do |classroom_teacher|
      classroom_teacher.void(reason)
    end
    classroom_facilities.each do |classroom_facility|
      classroom_facility.void(reason)
    end
  end
end
