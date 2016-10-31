require 'spec_helper'

describe Robot do
  subject(:robot) { Robot.new }

  describe 'ignore commands' do
    let(:position) { Position[10, 10] }

    let(:direction) { Direction::NORTH }

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
      before { robot.place(position, direction) }

      it_behaves_like 'raise Robot::CommandIgnoredError for all commands except place'
    end
  end

  describe '#move_forward' do
    subject(:move_forward) { robot.move_forward }

    before do
      robot.place(position, direction)
      move_forward
    end

    context 'placed where can always move' do
      let(:position) { Position::MIDDLE }

      context 'when direction is NORTH' do
        let(:direction) { Direction::NORTH }

        specify { expect(robot.position).to eq Position[2, 3] }
      end

      context 'when direction is EAST' do
        let(:direction) { Direction::EAST }

        specify { expect(robot.position).to eq Position[3, 2] }
      end

      context 'when direction is SOUTH' do
        let(:direction) { Direction::SOUTH }

        specify { expect(robot.position).to eq Position[2, 1] }
      end

      context 'when direction is WEST' do
        let(:direction) { Direction::WEST }

        specify { expect(robot.position).to eq Position[1, 2] }
      end
    end

    shared_examples 'does not move' do
      specify { expect(robot.position).to eq position }
    end

    context 'placed on edge facing edge' do
      describe 'NORTH edge' do
        let(:direction) { Direction::NORTH }
        let(:position) { Position[0, 4] }

        it_behaves_like 'does not move'
      end
      describe 'EAST edge' do
        let(:direction) { Direction::EAST }
        let(:position) { Position[4, 0] }

        it_behaves_like 'does not move'
      end
      describe 'SOUTH edge' do
        let(:direction) { Direction::SOUTH }
        let(:position) { Position[0, 0] }

        it_behaves_like 'does not move'
      end
      describe 'WEST edge' do
        let(:direction) { Direction::WEST }
        let(:position) { Position[0, 0] }

        it_behaves_like 'does not move'
      end
    end
  end

  describe '#turn_right' do
    let(:position) { Position[0, 0] }

    subject(:direction) { robot.direction }

    before do
      robot.place(position, initial_direction)
      robot.turn_right
    end

    context 'initial_direction is NORTH' do
      let(:initial_direction) { Direction::NORTH }
      it { is_expected.to eq Direction::EAST }
    end

    context 'initial_direction is EAST' do
      let(:initial_direction) { Direction::EAST }
      it { is_expected.to eq Direction::SOUTH }
    end

    context 'initial_direction is SOUTH' do
      let(:initial_direction) { Direction::SOUTH }
      it { is_expected.to eq Direction::WEST }
    end

    context 'initial_direction is WEST' do
      let(:initial_direction) { Direction::WEST }
      it { is_expected.to eq Direction::NORTH }
    end
  end

  describe '#turn_left' do
    let(:position) { Position[0, 0] }

    subject(:direction) { robot.direction }

    before do
      robot.place(position, initial_direction)
      robot.turn_left
    end

    context 'initial_direction is NORTH' do
      let(:initial_direction) { Direction::NORTH }
      it { is_expected.to eq Direction::WEST }
    end

    context 'initial_direction is EAST' do
      let(:initial_direction) { Direction::EAST }
      it { is_expected.to eq Direction::NORTH }
    end

    context 'initial_direction is SOUTH' do
      let(:initial_direction) { Direction::SOUTH }
      it { is_expected.to eq Direction::EAST }
    end

    context 'initial_direction is WEST' do
      let(:initial_direction) { Direction::WEST }
      it { is_expected.to eq Direction::SOUTH }
    end
  end
end
