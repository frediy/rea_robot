class CommandsInterpreter
  def initialize(commands_str, robot)
    @robot = robot
    @commands = commands_from_commands_str(commands_str)
  end

  def process
    @commands.each do |command|
      begin
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
          x, y, direction = position_and_direction_from_place_command(command)
          @robot.place(x, y, direction)
        end
      rescue Robot::CommandIgnoredError
      end
    end
  end

private

  def commands_from_commands_str(str)
    str ? str.split("\n") : []
  end

  def position_and_direction_from_place_command(command)
    position_and_direction_text = command.split(' ').last
    x, y, direction = position_and_direction_text.split(',')
    [x.to_i, y.to_i, direction]
  end
end