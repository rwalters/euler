require 'sum_of_multiples'

RSpec.describe SumOfMultiples do
  subject(:sum) { described_class.new(limit) }
  let(:limit)   { 1000 }

  it { is_expected.to_not be_nil }

  describe "#sum" do
    subject(:sum) { described_class.new(limit).sum }

    context "for a limit of 10" do
      let(:limit) { 10 }
      it { is_expected.to eq 23 }
    end

    context "for a limit of 20" do
      let(:limit) { 20 }
      it { is_expected.to eq 78 }
    end

    context "for a limit of 100" do
      let(:limit) { 100 }
      it { is_expected.to eq 2318 }
    end

    context "for a limit of 512" do
      let(:limit) { 512 }
      it { is_expected.to eq 60945 }
    end

    context "for a limit of 1000" do
      let(:limit) { 1000 }
      it { is_expected.to eq 233168 }
    end
  end
end
