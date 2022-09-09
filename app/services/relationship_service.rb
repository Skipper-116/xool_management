# frozen_string_literal: true

# Relationship service class
class RelationshipService
  def self.create_relationship(person_a, person_b, relationship_type)
    return if relationship_exists?(person_a, person_b)

    Relationship.create(person_a: person_a, person_b: person_b, relationship_types_id: relationship_type)
  end

  def self.relationship_exists?(person_a, person_b)
    Relationship.where(person_a: person_a, person_b: person_b).exists?
  end

  def self.update_relationship(relationship, relationship_params)
    relationship.update(relationship_params)
    relationship
  end

  def self.destroy_relationship(relationship)
    relationship.destroy
  end
end

# Compare this snippet from app/services/relationship_attribute_service.rb:
# # frozen_string_literal: true
#
# # Relationship attribute service class
# class RelationshipAttributeService
#   def self.create_relationship_attributes(relationship, relationship_attributes)
#     relationship_attributes.each do |relationship_attribute|
#       RelationshipAttribute.create(relationship_id: relationship.id,
#                                    person_attribute_type_id: relationship_attribute[:person_attribute_type_id],
#                                    value: relationship_attribute[:value])
#     end
#   end
#
#   def self.update_relationship_attributes(relationship, relationship_attributes)
#     RelationshipAttribute.where(relationship_id: relationship.id).destroy_all
#     relationship_attributes.each do |relationship_attribute|
#       RelationshipAttribute.create(relationship_id: relationship.id,
#                                    person_attribute_type_id: relationship_attribute[:person_attribute_type_id],
#                                    value: relationship_attribute[:value])
#     end
#   end
#
#   def self.destroy_relationship_attributes(relationship)
#     RelationshipAttribute.where(relationship_id: relationship.id).destroy_all
#   end
# end
#
# Compare this snippet from app/services/person_attribute_service.rb:
# # frozen_string_literal: true
#
# # Person attribute service class
# class PersonAttributeService
#   def self.create_person_attributes(person, person_attributes)
#     person_attributes.each do |person_attribute|
#       PersonAttribute.create(person_id: person.id,
#                              person_attribute_type_id: person_attribute[:person_attribute_type_id],
#                              value: person_attribute[:value])
#     end
#   end
#
#   def self.update_person_attributes(person, person_attributes)
#     PersonAttribute.where(person_id: person.id).destroy_all
#     person_attributes.each do |person_attribute|
#       PersonAttribute.create(person_id: person.id,
#                              person_attribute_type_id: person_attribute[:person_attribute_type_id],
#                              value: person_attribute[:value])
#     end
#   end
#
#
