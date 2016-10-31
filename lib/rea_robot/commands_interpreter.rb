class CommandsInterpreter
  def initialize(commands_str, robot)
    @robot = robot
    @commands = commands_from_commands_str(commands_str)
  end

  def process
    @commands.each do |command|
      begin
        send_command_to_robot(command)
      rescue Robot::CommandIgnoredError
      end
    end
  end

private

  def commands_from_commands_str(str)
    str ? str.split("\n") : []
  end

  def send_command_to_robot(command)
    case command
    when 'LEFT'
      @robot.turn_left
    when 'RIGHT'
      @robot.turn_right
    when 'MOVE'
      @robot.move_forward
    when 'REPORT'
      puts @robot.report
    else # PLACE
      position, direction = position_and_direction_from_place_command(command)
      @robot.place(position, direction)
    end
  end

  def position_and_direction_from_place_command(command)
    x_y_and_direction_str = command.split(' ').last
    x, y, direction = x_y_and_direction_str.split(',')
    [Vector[x.to_i, y.to_i], direction]
  end
end