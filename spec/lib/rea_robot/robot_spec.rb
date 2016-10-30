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

  # facing north, moves forward +1 y
  # facing east,  moves forward +1 x
  # facing south, moves forward -1 y
  # facing west,  moves forward -1 x
  # can't move off north edge
  # can't move off east edge
  # can't move off south edge
  # can't move off west edge
end
