require 'rails_helper'

RSpec.describe Participant, type: :model do
end

RSpec.describe Participant, "#name" do

  def validation_errors_for name
    participant = described_class.new( name: name )
    participant.valid?
    participant.errors[ :name ]
  end

  [
    "Bill",
    "Joe",
    "nil",
    "Timothy O'Neill",
  ].each do |name|
    it "#{ name } should be valid" do
      expect( validation_errors_for( name ) ).to be_empty
    end
  end

  [
    nil,
    ("a" * 300),
  ].each do |name|
    it "#{ name } should not be valid" do
      expect( validation_errors_for( name ) ).not_to be_empty
    end
  end
end
