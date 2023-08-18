# frozen_string_literal: true

class ClassroomFacility < VoidableRecord
  validates :name, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  belongs_to :classroom, optional: true
end
