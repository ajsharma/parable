# frozen_string_literal: true
class Scheduler

  def initialize(participants)
    unless participants.size.positive?
      raise ArgumentError, "Must provide at least one participant"
    end

    @participants = participants
    @participants.push(nil) if participants.size.odd?
  end

  def schedule
    n = participants.size
    pivot = participants.pop

    pairings = (n - 1).times.map do
      participants.rotate!
      [[participants.first, pivot]] + (1...(n / 2)).map { |j| [participants[j], participants[n - 1 - j]] }
    end

    participants.push pivot unless pivot.nil?

    pairings
  end

  private

  attr_reader :participants
end
