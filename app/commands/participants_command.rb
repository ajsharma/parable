# frozen_string_literal: true
class ParticipantsCommand < ApplicationCommand
  desc "create", "adds new members to your team"
  def create
    loop do
      puts "Input a participant's name (or hit ENTER to continue):"
      print "> "
      name = STDIN.gets.chomp
      break if name.empty?

      participant = Participant.new(name: name)

      if participant.save
        puts "Participant saved"
      else
        puts <<-RESPONSE.strip_heredoc.squish
          Participant was invalid
          #{participant.errors.full_messages.to_sentence}"
        RESPONSE
      end

      puts
    end
  end
end
