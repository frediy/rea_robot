class Robot
  class CommandIgnoredError < StandardError; end

  attr_reader :x, :y, :direction

  DIRECTIONS = ['NORTH', 'EAST', 'SOUTH', 'WEST']

  ## Writer Commands
  def place(x, y, direction)
    @x = x
    @y = y
    @direction = direction
  end

  def move_forward
    raise CommandIgnoredError if ignore_commands?
    case @direction
    when 'NORTH'
      @y += 1 if can_move_to?(x, y + 1)
    when 'EAST'
      @x += 1 if can_move_to?(x + 1, y)
    when 'SOUTH'
      @y -= 1 if can_move_to?(x, y - 1)
    else # 'WEST'
      @x -= 1 if can_move_to?(x - 1, y)
    end
  end

  def turn_left
    raise CommandIgnoredError if ignore_commands?
    @direction = DIRECTIONS[direction_index - 1]
  end

  def turn_right
    raise CommandIgnoredError if ignore_commands?
    @direction = DIRECTIONS[direction_index + 1 - DIRECTIONS.length]
  end

  ## Query Commands
  def report
    raise CommandIgnoredError if ignore_commands?
    "#{@x},#{@y},#{@direction}"
  end

private

  def direction_index
    DIRECTIONS.index(@direction)
  end

  def can_move_to?(x, y)
    PositionHelper.on_board?(x, y)
  end

  def ignore_commands?
    !placed? || !on_board?
  end

  def placed?
    @x && @y && @direction
  end

  def on_board?
    PositionHelper.on_board?(@x, @y)
  end
end
