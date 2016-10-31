module Position
  BOTTOM_LEFT_CORNER =  Vector.new(0, 0)
  BOTTOM_RIGHT_CORNER = Vector.new(1, 0)
  TOP_LEFT_CORNER =     Vector.new(0, 1)
  TOP_RIGHT_CORNER =    Vector.new(1, 1)
  MIDDLE =              Vector.new(2, 2)

  def self.on_board?(position)
    0 <= position.x && position.x <= 4 &&
    0 <= position.y && position.y <= 4
  end
end