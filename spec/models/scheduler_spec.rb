# frozen_string_literal: true
require "./app/models/pair"
require "./app/models/scheduler"

RSpec.describe Scheduler, ".initialize" do
  let(:mo) { "Mo" }
  let(:mary) { "Mary" }
  let(:pairs) { Pair.build_combinations(mo, mary) }

  it do
    expect { described_class.new([]) }.to raise_error(
      ArgumentError,
      "Must provide at least one pairing"
    )
  end

  it do
    expect { described_class.new(pairs) }.not_to raise_error
  end
end

RSpec.describe Scheduler, "#schedule" do
  let(:mo) { "Mo" }
  let(:mal) { "Mal" }
  let(:mary) { "Mary" }
  let(:moffett) { "Moffett" }

  context "with 1 pair" do
    let(:pairs) { Pair.build_combinations(mo, mary) }
    let(:subject) { described_class.new(pairs).schedule }

    it do
      is_expected.to match_array(
        [
          Pair.new(mo, mary)
        ]
      )
    end
  end

  context "with 4 pairs" do
    let(:pairs) { Pair.build_combinations(mo, mal, mary, moffett) }
    let(:subject) { described_class.new(pairs).schedule }

    it do
      is_expected.to match_array(
        [
          Pair.new(mo, mal),
          Pair.new(mary, moffett)
        ]
      )
    end
  end
end
