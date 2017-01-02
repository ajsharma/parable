# frozen_string_literal: true
class Scheduler

  def initialize(pairs)
    unless pairs.size.positive?
      raise ArgumentError, "Must provide at least one pairing"
    end

    @pairs = pairs
  end

  def schedule
    current_schedule = []
    remaining_pairs = pairs.dup

    until remaining_pairs.size.zero?
      current_pairing = remaining_pairs.pop
      current_schedule << current_pairing

      remaining_pairs.reject! do |pairing|
        pairing.overlaps?(current_pairing)
      end
    end

    current_schedule
  end

  private

  attr_reader :pairs
end
