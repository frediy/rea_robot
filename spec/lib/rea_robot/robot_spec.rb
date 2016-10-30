require 'spec_helper'

describe Robot do
  subject(:robot) { Robot.new }

  # discard move before first place command
  # discard right before first place command
  # discard left before first place command
  # discard right before first place command
  # discard report before first place command
  # facing north, moves forward +1 y
  # facing east,  moves forward +1 x
  # facing south, moves forward -1 y
  # facing west,  moves forward -1 x
  # can't move off north edge
  # can't move off east edge
  # can't move off south edge
  # can't move off west edge
  # not placed on table
  #   ignore move
  #   ignore left
  #   ignore right
  #   ignore report
end
