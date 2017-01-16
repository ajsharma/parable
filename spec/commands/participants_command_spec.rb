# frozen_string_literal: true
RSpec.describe ParticipantsCommand, type: :model do
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
