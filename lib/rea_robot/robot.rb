class Robot
  attr_reader :x, :y, :direction

  DIRECTIONS = Array.new(['NORTH', 'EAST', 'SOUTH', 'WEST'])

  def initialize
  end

  ## Writer methods
  def place(x, y, direction)
    @x = x
    @y = y
    @direction = direction
  end

  def move_forward
    case @direction
    when 'NORTH'
      @y += 1
    when 'EAST'
      @x += 1
    when 'SOUTH'
      @y -= 1
    else # 'WEST'
      @x -= 1
    end
  end

  def turn_left
    @direction = DIRECTIONS[direction_index - 1]
  end

  def turn_right
    @direction = DIRECTIONS[direction_index + 1 - DIRECTIONS.length]
  end

  ## Query methods
  def position_and_direction_text
    "#{@x},#{@y},#{@direction}"
  end

private

  def direction_index
    DIRECTIONS.index(@direction)
  end
end
