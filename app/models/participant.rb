# frozen_string_literal: true
class Participant < ApplicationRecord
  validates(
    :name,
    length: { maximum: 255 },
    presence: true
  )
end
