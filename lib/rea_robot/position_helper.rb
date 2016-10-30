module PositionHelper
  def self.on_board?(x, y)
    0 <= x && x <= 4 &&
    0 <= y && y <= 4
  end
end