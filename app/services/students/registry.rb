# frozen_string_literal: true

module Students
  # this class will manage student registry related operations
  class Registry
    attr_reader :classroom_id

    def initialize(classroom_id)
      @classroom_id = classroom_id
    end

    # fetch all students in a particular class
    def fetch_students(cohort_term = nil)
      classroom.classroom_students.where(cohort_term_id: cohort_term.id || latest_cohort_term.id).map(&:person)
    end

    # add student registry
    def add_student_registry(params)
      classroom.classroom_students.create!(params)
    end

    # fetch registry of a particular class and day
    def fetch_registry(date)
      classroom.student_registries.where('DATE(obs_datetime) = DATE(?)', date.strftime('%Y-%m-%d'))
    end

    private

    # get the classroom
    def classroom
      @classroom ||= Classroom.find classroom_id
    end

    # get the latest cohort term
    def latest_cohort_term
      CohortTerm.where('end_date <= DATE(?)', Date.today)&.order(:start_date)&.first || CohortTerm.last
    end
  end
end
