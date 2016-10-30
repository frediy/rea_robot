module Position
  def self.on_board?(position)
    0 <= position.x && position.x <= 4 &&
    0 <= position.y && position.y <= 4
  end
end