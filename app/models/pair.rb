# frozen_string_literal: true
require "set"

class Pair
  include Comparable

  def self.build_combinations(*objects)
    objects.push(nil) if objects.size.odd?
    objects.combination(2).map do |participant, other_participant|
      new(participant, other_participant)
    end
  end

  def initialize(participant, other_participant)
    self.objects = [participant, other_participant]
  end

  def <=>(other)
    objects.to_set <=> other.objects.to_set
  end

  def include?(object)
    objects.include?(object)
  end

  def overlaps?(other_pair)
    objects.any? { |object| other_pair.include?(object) }
  end

  protected

  attr_accessor :objects
end
