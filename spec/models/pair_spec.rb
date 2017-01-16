# frozen_string_literal: true
RSpec.describe Pair, ".build_combinations" do
  let(:mo) { "Mo" }
  let(:mary) { "Mary" }
  let(:moffett) { "Moffett" }

  context "with no participants" do
    let(:subject) { described_class.build_combinations }

    it do
      is_expected.to be_empty
    end
  end

  context "with one participant" do
    let(:subject) { described_class.build_combinations(mo) }

    it do
      is_expected.to match_array(
        [
          Pair.new(mo, nil)
        ]
      )
    end
  end

  context "with two participants" do
    let(:subject) { described_class.build_combinations(mo, mary) }

    it do
      is_expected.to match_array(
        [
          Pair.new(mo, mary)
        ]
      )
    end
  end

  context "with three participants" do
    let(:subject) { described_class.build_combinations(mo, mary, moffett) }

    it do
      is_expected.to match_array(
        [
          Pair.new(mo, mary),
          Pair.new(mo, moffett),
          Pair.new(mo, nil),
          Pair.new(mary, moffett),
          Pair.new(mary, nil),
          Pair.new(moffett, nil),
        ]
      )
    end
  end
end

RSpec.describe Pair, "#==" do
  let(:mo) { "Mo" }
  let(:mary) { "Mary" }
  let(:moffett) { "Moffett" }

  it do
    expect(described_class.new(nil, nil)).to eq(described_class.new(nil, nil))
  end

  it do
    expect(described_class.new(mo, mo)).to eq(described_class.new(mo, mo))
  end

  it do
    expect(described_class.new(mo, mary)).to eq(described_class.new(mo, mary))
  end

  it do
    expect(described_class.new(mo, mary)).to eq(described_class.new(mary, mo))
  end

  it do
    expect(described_class.new(mo, moffett)).
      not_to eq(described_class.new(mo, mary))
  end
end

RSpec.describe Pair, "#include?" do
  let(:mo) { "Mo" }
  let(:mary) { "Mary" }
  let(:moffett) { "Moffett" }

  it { expect(described_class.new(mo, mo)).to include(mo) }
  it { expect(described_class.new(mo, mary)).to include(mo) }
  it { expect(described_class.new(mo, mary)).to include(mary) }

  it { expect(described_class.new(mo, mary)).not_to include(moffett) }
end

RSpec.describe Pair, "#overlaps?" do
  let(:mo) { "Mo" }
  let(:mary) { "Mary" }
  let(:moffett) { "Moffett" }

  it do
    expect(
      described_class.new(mo, mo).
        overlaps?(described_class.new(mo, mo))
    ).to be_truthy
  end

  it do
    expect(
      described_class.new(mo, mary).
        overlaps?(described_class.new(mary, moffett))
    ).to be_truthy
  end

  it do
    expect(
      described_class.new(mo, mary).
        overlaps?(described_class.new(moffett, moffett))
    ).to be_falsey
  end
end
