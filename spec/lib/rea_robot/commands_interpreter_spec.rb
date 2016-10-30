require 'spec_helper'

describe CommandsInterpreter do
  let(:robot) { Robot.new }

  subject(:commands_interpreter) { CommandsInterpreter.new(commands_string, robot) }

  describe '#process' do
    subject(:process) { commands_interpreter.process }

    describe 'problem examples' do
      describe 'example a' do
        let(:commands_string) do
          <<-eos
PLACE 0,0,NORTH
LEFT
RIGHT
MOVE
REPORT
          eos
        end

        specify do
          expect(robot).to receive(:place).with(0,0,'NORTH').ordered
          expect(robot).to receive(:turn_left).ordered
          expect(robot).to receive(:turn_right).ordered
          expect(robot).to receive(:move_forward).ordered
          expect(robot).to receive(:report).ordered
          process
        end
      end
    end
  end
end
