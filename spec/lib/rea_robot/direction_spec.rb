require 'spec_helper'

describe Direction do
  subject(:direction) { Direction::NORTH }

  describe '.from_str' do
    subject(:from_str) { Direction.from_str(str) }

    context 'str is NORTH' do
      let(:str) { 'NORTH' }
      it { is_expected.to eq Direction::NORTH }
    end

    context 'str is EAST' do
      let(:str) { 'EAST' }
      it { is_expected.to eq Direction::EAST }
    end

    context 'str is SOUTH' do
      let(:str) { 'SOUTH' }
      it { is_expected.to eq Direction::SOUTH }
    end

    context 'str is WEST' do
      let(:str) { 'WEST' }
      it { is_expected.to eq Direction::WEST }
    end
  end

  describe '.from_vector' do
    let(:vector) { Vector[0, 1] }

    subject(:from_vector) { Direction.from_vector(vector) }

    it { is_expected.to eq Direction[0, 1] }
    it { is_expected.to be_a Direction }
  end

  describe '.to_s' do
    subject(:to_s) { direction.to_s }

    context 'direction is NORTH' do
      let(:direction) { Direction::NORTH }
      it { is_expected.to eq 'NORTH' }
    end

    context 'direction is EAST' do
      let(:direction) { Direction::EAST }
      it { is_expected.to eq 'EAST' }
    end

    context 'direction is SOUTH' do
      let(:direction) { Direction::SOUTH }
      it { is_expected.to eq 'SOUTH' }
    end

    context 'direction is WEST' do
      let(:direction) { Direction::WEST }
      it { is_expected.to eq 'WEST' }
    end
  end

  describe '#rotate_counter_clockwise' do
    subject(:rotate_counter_clockwise) { direction.rotate_counter_clockwise }

    context 'direction is NORTH' do
      let(:direction) { Direction::NORTH }
      it { is_expected.to eq Direction::WEST }
    end

    context 'direction is EAST' do
      let(:direction) { Direction::EAST }
      it { is_expected.to eq Direction::NORTH }
    end

    context 'direction is SOUTH' do
      let(:direction) { Direction::SOUTH }
      it { is_expected.to eq Direction::EAST }
    end

    context 'direction is WEST' do
      let(:direction) { Direction::WEST }
      it { is_expected.to eq Direction::SOUTH }
    end
  end

  describe '#rotate_clockwise' do
    subject(:rotate_clockwise) { direction.rotate_clockwise }

    context 'direction is NORTH' do
      let(:direction) { Direction::NORTH }
      it { is_expected.to eq Direction::EAST }
    end

    context 'direction is EAST' do
      let(:direction) { Direction::EAST }
      it { is_expected.to eq Direction::SOUTH }
    end

    context 'direction is SOUTH' do
      let(:direction) { Direction::SOUTH }
      it { is_expected.to eq Direction::WEST }
    end

    context 'direction is WEST' do
      let(:direction) { Direction::WEST }
      it { is_expected.to eq Direction::NORTH }
    end
  end

  describe '#+' do
    subject(:+) { direction + other }

    context 'other is position' do
      let(:other) { Position[1,1] }

      it { is_expected.to eq Position[1,2] }
      it { is_expected.to be_a Position }
    end

    context 'other is vector' do
      let(:other) { Vector[1,1] }

      it { is_expected.to eq Vector[1,2] }
      it { is_expected.to be_a Vector }
    end
  end
end
