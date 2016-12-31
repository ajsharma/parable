class Scheduler
  # def self.schedule(participants)
  #   participants.push(nil) if participants.size.odd?

  #   n = participants.size
  #   pivot = participants.pop
  #   pairings = (n - 1).times.map do
  #     participants.rotate!
  #     [[participants.first, pivot]] + (1...(n / 2)).map { |j| [participants[j], participants[n - 1 - j]] }
  #   end
  #   participants.push pivot unless pivot.nil?
  #   pairings
  # end

  ###

  attr_reader :participants

  def initialize(participants)
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
end
