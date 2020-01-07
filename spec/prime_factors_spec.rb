require 'prime_factors'

RSpec.describe PrimeFactors do
  let(:factors) { described_class.new(target) }
  let(:target)     { 78 }

  it { is_expected.to_not be_nil }

  describe "#largest" do
    subject(:largest) { factors.largest }

    context "for a limit of 10" do
      # prime factors are 2 and 5
      let(:target) { 10 }

      it { is_expected.to eq 5 }
    end

    context "for a limit of 13195" do
      # prime factors are 5, 7, 13 and 29
      let(:target) { 13195 }

      it { is_expected.to eq 29 }
    end

    context "for a limit of 600851475143" do
      # prime factors are ...
      let(:target) { 600851475143 }

      it { is_expected.to eq 6857 }
    end
  end
end
