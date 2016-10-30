require 'spec_helper'

describe Robot do
  subject(:robot) { Robot.new }

  describe 'ignore commands' do
    shared_examples 'ignore all commands' do
      # ignore move before first place command
      # ignore right before first place command
      # ignore left before first place command
      # ignore report before first place command
    end

    context 'when not placed' do
      it_behaves_like 'ignore all commands'
    end

    context 'when placed off board' do
      it_behaves_like 'ignore all commands'
    end
  end

  describe '#move_forward' do
    subject(:move_forward) { robot.move_forward }

    before do
      robot.place(x, y, direction)
      move_forward
    end

    context 'placed where can always move (middle)' do
      let(:x) { 3 }
      let(:y) { 3 }

      context 'when direction is NORTH' do
        let(:direction) { 'NORTH' }

        specify { expect(robot.x).to eq x }
        specify { expect(robot.y).to eq y + 1 }
      end

      context 'when direction is EAST' do
        let(:direction) { 'EAST' }

        specify { expect(robot.x).to eq x + 1 }
        specify { expect(robot.y).to eq y }
      end

      context 'when direction is SOUTH' do
        let(:direction) { 'SOUTH' }

        specify { expect(robot.x).to eq x }
        specify { expect(robot.y).to eq y - 1 }
      end

      context 'when direction is WEST' do
        let(:direction) { 'WEST' }

        specify { expect(robot.x).to eq x - 1 }
        specify { expect(robot.y).to eq y }
      end
    end

    context 'placed on edge facing edge' do
      # can't move off north edge
      # can't move off east edge
      # can't move off south edge
      # can't move off west edge
    end
  end

  describe '#turn_right' do
  end

  describe '#turn_left' do
  end

end
