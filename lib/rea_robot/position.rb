module Position
  BOTTOM_LEFT_CORNER =  Vector[0, 0]
  BOTTOM_RIGHT_CORNER = Vector[1, 0]
  TOP_LEFT_CORNER =     Vector[0, 1]
  TOP_RIGHT_CORNER =    Vector[1, 1]
  MIDDLE =              Vector[2, 2]

  def self.on_board?(position)
    0 <= position[0] && position[0] <= 4 &&
    0 <= position[1] && position[1] <= 4
  end
end