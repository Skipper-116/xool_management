# frozen_string_literal: true

# This class is used to model a voidable record
class VoidableRecord < ApplicationRecord
  self.abstract_class = true
  
  include Voidable

  default_scope { where(voided: 0) }
  scope :voided, -> { unscoped.where.not(voided: 0) }
end
