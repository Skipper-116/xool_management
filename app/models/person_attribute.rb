# frozen_string_literal: true

class PersonAttribute < VoidableRecord
  belongs_to :person
  belongs_to :person_attribute_type
end
