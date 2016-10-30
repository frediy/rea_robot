class Robot
  class CommandIgnoredError < StandardError; end

  attr_reader :position, :direction

  def x
    @position.x
  end

  def y
    @position.y
  end

  def direction_vector
    case @direction
    when 'NORTH'
      Vector.new(0, 1)
    when 'EAST'
      Vector.new(1, 0)
    when 'SOUTH'
      Vector.new(0, -1)
    else # WEST
      Vector.new(-1, 0)
    end
  end

  DIRECTIONS = ['NORTH', 'EAST', 'SOUTH', 'WEST']

  ## Writer Commands
  def place(position, direction)
    @position = position
    @direction = direction
  end

  def move_forward
    raise CommandIgnoredError if ignore_commands?
    new_position = @position + direction_vector
    @position = new_position if can_move_to?(new_position)
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
    "#{@position.x},#{@position.y},#{@direction}"
  end

private

  def direction_index
    DIRECTIONS.index(@direction)
  end

  def can_move_to?(position)
    Position.on_board?(position)
  end

  def ignore_commands?
    !placed? || !on_board?
  end

  def placed?
    @position && @direction
  end

  def on_board?
    Position.on_board?(@position)
  end
end
