# frozen_string_literal: true

# This class is used to manage person attributes and services
class PersonAttributeService
  def create_attribute(person, attributes)
    attributes.each do |attribute|
      next unless validate_attribute(attribute)

      person.person_attributes.create(attribute)
    end
  end

  def validate_attribute(attribute)
    attr_type = PersonAttributeType.find(attribute[:person_attribute_type_id])
    input_type = attr_type.input_type.pattern
    return true if input_type.blank?
    return true if input_type.match(attribute[:attribute_value])

    false
  end

  def update_attribute(attribute)
    return unless validate_attribute(attribute)

    attribute.save
  end
end
