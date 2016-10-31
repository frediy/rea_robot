require 'spec_helper'

describe Position do
  let(:x) { 0 }
  let(:y) { 0 }

  subject(:position) { Position[x, y] }

  describe '#x' do
    let(:x) { 1 }

    specify { expect(position.x).to eq x }
  end

  describe '#y' do
    let(:x) { y }

    specify { expect(position.y).to eq y }
  end

  describe '#to_s' do
    let(:x) { 1 }
    let(:y) { 1 }

    specify { expect(position.to_s).to eq '1,1' }
  end

  describe '#on_board?' do
    subject(:on_board?) { position.on_board? }

    context 'on board' do
      describe 'position is bottom left corner' do
        let(:position) { Position::BOTTOM_LEFT_CORNER }
        it { is_expected.to be true }
      end

      describe 'position is bottom right corner' do
        let(:position) { Position::BOTTOM_RIGHT_CORNER }
        it { is_expected.to be true }
      end

      describe 'position is top left corner' do
        let(:position) { Position::TOP_LEFT_CORNER }
        it { is_expected.to be true }
      end

      describe 'position is top right corner' do
        let(:position) { Position::TOP_RIGHT_CORNER }
        it { is_expected.to be true }
      end

      describe 'position is middle' do
        let(:position) { Position::MIDDLE }
        it { is_expected.to be true }
      end
    end

    context 'not on board' do
      describe 'just off top edge' do
        let(:position) { Position[2, 5] }
        it { is_expected.to be false }
      end
      describe 'just off right edge' do
        let(:position) { Position[5, 2] }
        it { is_expected.to be false }
      end
      describe 'just off bottom edge' do
        let(:position) { Position[2, -1] }
        it { is_expected.to be false }
      end
      describe 'just off left edge' do
        let(:position) { Position[-1, 2] }
        it { is_expected.to be false }
      end
    end
  end
end
