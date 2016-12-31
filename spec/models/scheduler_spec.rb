# frozen_string_literal: true
require "./app/models/scheduler"

RSpec.describe Scheduler, ".initialize" do
  let(:mo) { "Mo" }
  let(:mary) { "Mary" }

  it do
    expect { described_class.new([]) }.to raise_error(
      ArgumentError,
      "Must provide at least one participant"
    )
  end

  it do
    expect { described_class.new([mo, mary]) }.not_to raise_error
  end
end

RSpec.describe Scheduler, "#schedule" do
  let(:mo) { "Mo" }
  let(:mary) { "Mary" }
  let(:moffett) { "Moffett" }

  context "with 1 participants" do
    let(:subject) do
      described_class.new([mo]).schedule
    end

    it do
      is_expected.to match_array([[[mo, nil]]])
    end
  end

  context "with 2 participants" do
    let(:subject) do
      described_class.new([mo, mary]).schedule
    end

    it do
      is_expected.to match_array([[[mo, mary]]])
    end
  end

  context "with 3 participants" do
    let(:subject) do
      described_class.new([mo, mary, moffett]).schedule
    end

    it do
      is_expected.to match_array(
        [
          [[mary, nil], [moffett, mo]],
          [[mo, nil], [mary, moffett]],
          [[moffett, nil], [mo, mary]]
        ]
      )
    end
  end
end
