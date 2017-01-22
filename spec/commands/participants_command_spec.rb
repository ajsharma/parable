# frozen_string_literal: true
RSpec.describe ParticipantsCommand, type: :model do
  describe "#index" do
    context "with no names" do
      it do
        expect(STDOUT).not_to receive(:puts)
        subject.index
      end
    end

    context "with two names" do
      let!(:participant_foo) do
        Participant.create!(name: "Foo")
      end

      let!(:participant_bar) do
        Participant.create!(name: "Bar")
      end

      it do
        expect(STDOUT).to receive(:puts).with("Bar").exactly(:once)
        expect(STDOUT).to receive(:puts).with("Foo").exactly(:once)
        subject.index
      end
    end
  end

  describe "#create" do
    context "with two valid names" do
      it do
        expect(STDIN).to receive(:gets).and_return(
          "Test name",
          "Other name",
          "",
        )
        expect { subject.create }.to change(Participant, :count).by(2)
      end
    end

    context "with an invalid name" do
      it do
        expect(STDIN).to receive(:gets).and_return(
          ("a" * 300),
          "",
        )
        expect { subject.create }.not_to change(Participant, :count)
      end
    end
  end
end
