class ClassroomStudent < VoidableRecord
  belongs_to :classroom
  belongs_to :cohort_term
  belongs_to :person

  validates :classroom_id, :cohort_term_id, :person_id, presence: true

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
