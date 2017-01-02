# frozen_string_literal: true
require "./app/models/pair"

class RankedPair < Pair

  def initialize(participant, other_participant, last_met_at)
    super
    @last_met_at = last_met_at
  end
end
