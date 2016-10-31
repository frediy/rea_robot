class Position < Vector
  BOTTOM_LEFT_CORNER =  Position[0, 0]
  BOTTOM_RIGHT_CORNER = Position[1, 0]
  TOP_LEFT_CORNER =     Position[0, 1]
  TOP_RIGHT_CORNER =    Position[1, 1]
  MIDDLE =              Position[2, 2]

  def x
    self[0]
  end

  def y
    self[1]
  end

  def +(other)
    if other.is_a?(Position) || other.is_a?(Direction)
      Position[self.x + other.x, self.y + other.y]
    else
      super(other)
    end
  end

  def on_board?
    0 <= x && x <= 4 &&
    0 <= y && y <= 4
  end
end