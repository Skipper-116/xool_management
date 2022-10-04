# frozen_string_literal: true

# This class is used to model a person in the system
class Person < VoidableRecord
  # birthdate is required and must be in the past
  validates :birthdate, presence: true
  validate :birthdate_should_be_in_the_past
  # gender_id is required
  validates :gender_id, presence: true

  # Relationships
  belongs_to :gender, optional: true
  # has one person_name
  has_one :person_name, dependent: :destroy
  # has many person_attributes
  has_many :person_attributes, dependent: :destroy
  # has many user roles
  has_many :user_roles, dependent: :destroy
  # has one user
  has_one :user, dependent: :destroy
  # has zero or more relationships
  has_many :relationships, dependent: :destroy, foreign_key: :person_a

  # custom methods
  def birthdate_should_be_in_the_past
    errors.add(:birthdate, 'cannot be in the future') if
      !birthdate.blank? && birthdate > Date.today
  end

  def name
    @name ||= "#{person_name.given_name} #{person_name.family_name}"
  end

  def email
    @email ||= person_attributes.where(person_attribute_type_id: (PersonAttributeType.find_by_name 'Email Address'))&.first&.attribute_value
  end
end
