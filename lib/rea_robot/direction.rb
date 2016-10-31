class Direction < Vector
  NORTH = Direction[0, 1]
  EAST  = Direction[1, 0]
  SOUTH = Direction[0, -1]
  WEST  = Direction[-1, 0]

  def self.from_string(str)
    Object.const_get("Direction::#{str}")
  end
end