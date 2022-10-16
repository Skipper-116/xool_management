class ClassroomStudent < VoidableRecord
  after_validation :student_already_in_classroom, :space_available
  belongs_to :classroom
  belongs_to :cohort_term
  belongs_to :person

  validates :classroom_id, :cohort_term_id, :person_id, presence: true

  # before creating a new classroom_student, check if the student is already in the classroom
  def student_already_in_classroom
    return unless ClassroomStudent.where(classroom_id: classroom_id, person_id: person_id).exists?

    errors.add(:person_id, 'Student is already in this classroom')
  end

  # befoe creating check if space is available
  def space_available
    return unless classroom.space <= classroom.classroom_students.count

    errors.add(:classroom_id, 'Classroom is full')
  end

  # json output
  def as_json(options = {})
    super(options.merge(
      only: %i[id classroom_id cohort_term_id person_id created_at updated_at],
      include: {
        person:,
        classroom:,
        cohort_term:
      }
    ))
  end
end
