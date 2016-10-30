require 'spec_helper'

describe CommandsInterpreter do
  let(:robot) { Robot.new }

  subject(:commands_interpreter) { CommandsInterpreter.new(commands_string, robot) }

  describe '#process and #output' do
    subject(:process) { commands_interpreter.process }

    describe 'problem examples' do
      describe 'example a' do
        let(:commands_string) do
          <<-eos
PLACE 0,0,NORTH
MOVE
REPORT
          eos
        end

        specify { expect{ process }.to output("0,1,NORTH\n").to_stdout }
      end

      describe 'example b' do
        let(:commands_string) do
          <<-eos
PLACE 0,0,NORTH
LEFT
REPORT
          eos
        end

        specify { expect{ process }.to output("0,0,WEST\n").to_stdout }
      end

      describe 'example c' do
        let(:commands_string) do
          <<-eos
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
          eos
        end

        specify { expect{ process }.to output("3,3,NORTH\n").to_stdout }
      end
    end
  end
end
