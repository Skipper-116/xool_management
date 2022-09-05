# frozen_string_literal: true

# This class is used to model a person in the system
class Person < VoidableRecord
  belongs_to :gender
  # has one person_name
  has_one :person_name, dependent: :destroy
  # has many person_addresses
  has_many :person_addresses, dependent: :destroy
  # has many person_attributes
  has_many :person_attributes, dependent: :destroy

  def name
    @name || "#{person_name.given_name} #{person_name.family_name}"
  end
end
