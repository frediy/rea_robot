require 'spec_helper'

describe CommandsInterpreter do
  let(:robot) { Robot.new }

  subject(:commands_interpreter) { CommandsInterpreter.new(commands_string, robot) }

  describe '#process' do
    let(:position) { Position[0, 0] }
    let(:direction) { Direction::NORTH }

    subject(:process) { commands_interpreter.process }

    before do
      allow(Position).to receive(:[]).with(0, 0).and_return position
      allow(Direction).to receive(:from_str).with('NORTH').and_return direction
    end

    after { process }

    context 'mutliple commands' do
      let(:commands_string) do
        <<-eos
PLACE 0,0,NORTH
LEFT
RIGHT
MOVE
REPORT
        eos
      end

      it 'receives any command in correct order' do
        expect(robot).to receive(:place).with(position, direction)
        expect(robot).to receive(:turn_left).ordered
        expect(robot).to receive(:turn_right).ordered
        expect(robot).to receive(:move_forward).ordered
        expect(robot).to receive(:report).ordered
      end
    end

    context 'single commands' do
      describe 'PLACE' do
        let(:commands_string) { 'PLACE 0,0,NORTH' }
        specify { expect(robot).to receive(:place).with(position, direction) }
      end

      describe 'LEFT' do
        let(:commands_string) { 'LEFT' }
        specify { expect(robot).to receive(:turn_left) }
      end

      describe 'RIGHT' do
        let(:commands_string) { 'RIGHT' }
        specify { expect(robot).to receive(:turn_right) }
      end

      describe 'MOVE' do
        let(:commands_string) { 'MOVE' }
        specify { expect(robot).to receive(:move_forward) }
      end

      describe 'REPORT' do
        let(:commands_string) { 'REPORT' }
        specify { expect(robot).to receive(:report) }
      end
    end
  end
end
