require 'spec_helper'

describe CommandsInterpreter do
  let(:robot) { Robot.new }

  subject(:commands_interpreter) { CommandsInterpreter.new(commands_string, robot) }

  describe '#process and #output' do
    subject(:output) { commands_interpreter.output }

    before { commands_interpreter.process }

    describe 'problem example a' do
      let(:commands_string) do
        <<-eos
PLACE 0,0,NORTH
MOVE
REPORT
        eos
      end

      it { is_expected.to eq '0,1,NORTH' }
    end

    describe 'problem example b' do
      let(:commands_string) do
        <<-eos
PLACE 0,0,NORTH
LEFT
REPORT
        eos
      end

      it { is_expected.to eq '0,0,WEST' }
    end

    describe 'problem example c' do
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

      it { is_expected.to eq '3,3,NORTH' }
    end
  end
end
