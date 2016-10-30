require 'spec_helper'

describe Robot do
  subject(:robot) { Robot.new }

  describe 'ignore commands' do
    let(:x) { 10 }
    let(:y) { 10 }
    let(:direction) { 'NORTH' }

    shared_examples 'raise Robot::CommandIgnoredError for all commands except place' do
      describe 'ignore #move_forward' do
        subject(:move_forward) { robot.move_forward }

        specify { expect { move_forward }.to raise_error(Robot::CommandIgnoredError) }
      end

      describe 'ignore #turn_left' do
        subject(:turn_left) { robot.turn_left }

        specify { expect { turn_left }.to raise_error(Robot::CommandIgnoredError) }
      end

      describe 'ignore #turn_right' do
        subject(:turn_right) { robot.turn_right }

        specify { expect { turn_right }.to raise_error(Robot::CommandIgnoredError) }
      end

      describe 'ignore #report' do
        subject(:report) { robot.report }

        specify { expect { report }.to raise_error(Robot::CommandIgnoredError) }
      end
    end

    context 'when not placed' do
      it_behaves_like 'raise Robot::CommandIgnoredError for all commands except place'
    end

    context 'when placed off board' do
      before { robot.place(x, y, direction) }

      it_behaves_like 'raise Robot::CommandIgnoredError for all commands except place'
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

    shared_examples 'does not move' do
      specify { expect(robot.x).to eq x }
      specify { expect(robot.y).to eq y }
    end

    context 'placed on edge facing edge' do
      describe 'NORTH edge' do
        let(:direction) { 'NORTH' }
        let(:x) { 0 }
        let(:y) { 4 }

        it_behaves_like 'does not move'
      end
      describe 'EAST edge' do
        let(:direction) { 'EAST' }
        let(:x) { 4 }
        let(:y) { 0 }

        it_behaves_like 'does not move'
      end
      describe 'SOUTH edge' do
        let(:direction) { 'SOUTH' }
        let(:x) { 0 }
        let(:y) { 0 }

        it_behaves_like 'does not move'
      end
      describe 'WEST edge' do
        let(:direction) { 'WEST' }
        let(:x) { 0 }
        let(:y) { 0 }

        it_behaves_like 'does not move'
      end
    end
  end

  describe '#turn_right' do
    let(:x) { 0 }
    let(:y) { 0 }

    subject(:direction) { robot.direction }

    before do
      robot.place(x, y, initial_direction)
      robot.turn_right
    end

    context 'initial_direction is NORTH' do
      let(:initial_direction) { 'NORTH' }
      it { is_expected.to eq 'EAST' }
    end

    context 'initial_direction is EAST' do
      let(:initial_direction) { 'EAST' }
      it { is_expected.to eq 'SOUTH' }
    end

    context 'initial_direction is SOUTH' do
      let(:initial_direction) { 'SOUTH' }
      it { is_expected.to eq 'WEST' }
    end

    context 'initial_direction is WEST' do
      let(:initial_direction) { 'WEST' }
      it { is_expected.to eq 'NORTH' }
    end
  end

  describe '#turn_left' do
    let(:x) { 0 }
    let(:y) { 0 }

    subject(:direction) { robot.direction }

    before do
      robot.place(x, y, initial_direction)
      robot.turn_left
    end

    context 'initial_direction is NORTH' do
      let(:initial_direction) { 'NORTH' }
      it { is_expected.to eq 'WEST' }
    end

    context 'initial_direction is EAST' do
      let(:initial_direction) { 'EAST' }
      it { is_expected.to eq 'NORTH' }
    end

    context 'initial_direction is SOUTH' do
      let(:initial_direction) { 'SOUTH' }
      it { is_expected.to eq 'EAST' }
    end

    context 'initial_direction is WEST' do
      let(:initial_direction) { 'WEST' }
      it { is_expected.to eq 'SOUTH' }
    end
  end
end
