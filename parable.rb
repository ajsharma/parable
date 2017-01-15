# frozen_string_literal: true
require "thor"

class Parable < Thor
  desc "init", "starts building the CSV of your team"
  def init


    names = []
    loop do
      puts "Input a team member's name (or hit ENTER to continue):"
      print "> "
      response = STDIN.gets.chomp
      break if response.empty?

      names << response
    end

    puts "Your names"
    puts names

    pairs = Pair.build_combinations(*names)
    database.create_or_update_pairs pairs
  end

  desc "schedule", "builds a schedule based on the provided CSV"
  def schedule
    # TODO:
  end
end

Parable.start(ARGV)
