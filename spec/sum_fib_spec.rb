require 'sum_fib'

RSpec.describe SumFib do
  subject(:sum) { described_class.new(max) }
  let(:max)     { 1000 }

  it { is_expected.to_not be_nil }

  describe "#sum" do
    subject(:sum) { described_class.new(max).sum }

    context "for a limit of 10" do
      # vals will be 1,1,2,3,5,8
      # so, only 2, 8 are even
      # the sum will be 10
      let(:max) { 10 }
      it { is_expected.to eq 10 }
    end

    context "for a limit of 20" do
      # 1,1,2,3,5,8,13
      # so, 2,8 are even
      let(:max) { 20 }
      it { is_expected.to eq 10 }
    end

    context "for a limit of 100" do
      # 1,1,2,3,5,8,13,21,34,55,89
      # 2,8,34 are even
      let(:max) { 100 }
      it { is_expected.to eq 44 }
    end

    context "for a limit of 512" do
      # 1,1,2,3,5,8,13,21,34,55,89,144,233,377
      # 2,8,34,144 are even
      let(:max) { 512 }
      it { is_expected.to eq 188 }
    end

    context "for a limit of 1000" do
      # 1,1,2,3,5,8,13,21,34,55,89,144,233,377,610,987
      # 2,8,34,144,610 are even
      let(:max) { 1000 }
      it { is_expected.to eq 798 }
    end

    context "for a limit of 4_000_000" do
      # 2,8,34,144,610,2484,10946,46368,196418,832040,3524578,14930352 are even
      let(:max) { 4_000_000 }
      it { is_expected.to eq 4613732 }
    end
  end
end
