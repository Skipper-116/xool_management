# frozen_string_literal: true

class PersonAttributeType < VoidableRecord
  belongs_to :input_type, foreign_key: :input_types_id, class_name: 'InputType', optional: true
end
