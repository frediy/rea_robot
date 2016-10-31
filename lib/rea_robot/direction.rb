class Direction < Vector
  NORTH = Direction[0, 1]
  EAST  = Direction[1, 0]
  SOUTH = Direction[0, -1]
  WEST  = Direction[-1, 0]

  def self.from_str(str)
    Object.const_get("Direction::#{str}")
  end

  def self.from_vector(vector)
    Direction[vector[0], vector[1]]
  end

  def to_s
    case self
    when NORTH
      'NORTH'
    when EAST
      'EAST'
    when SOUTH
      'SOUTH'
    when WEST
      'WEST'
    else
      super
    end
  end

  def rotate_counter_clockwise
    Direction.from_vector(Matrix[[0, -1], [1, 0]] * self)
  end

  def rotate_clockwise
    Direction.from_vector(Matrix[[0, 1], [-1, 0]] * self)
  end

  def +(other)
    if other.is_a?(Position)
      Position[self[0] + other[0], self[1] + other[1]]
    else
      super(other)
    end
  end
end