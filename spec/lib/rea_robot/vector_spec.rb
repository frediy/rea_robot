require 'spec_helper'

describe Vector do
  let(:x) { 0 }
  let(:y) { 0 }

  subject(:vector) { Vector.new(x, y) }

  describe '#==' do
    let(:other_x) { 0 }
    let(:other_y) { 0 }

    let(:other) { Vector.new(other_x, other_y) }

    subject(:==) { vector == other }

    context 'x and y equal' do
      it { is_expected.to be true }
    end

    context 'only x is equal' do
      let(:other_y) { 1 }
      it { is_expected.to be false }
    end

    context 'only y is equal' do
      let(:other_x) { 1 }
      it { is_expected.to be false }
    end

    context 'neither x nor y equal' do
      let(:other_y) { 1 }
      let(:other_x) { 1 }
      it { is_expected.to be false }
    end
  end

  describe '#+' do
    let(:other) { Vector.new(other_x, other_y) }

    subject(:+) { vector + other }

    context 'other x and y positive' do
      let(:other_x) { 2 }
      let(:other_y) { 3 }

      it { is_expected.to eq Vector.new(2, 3) }
    end

    context 'other x and y negative' do
      let(:other_x) { -2 }
      let(:other_y) { -3 }

      it { is_expected.to eq Vector.new(-2, -3) }
    end
  end
end