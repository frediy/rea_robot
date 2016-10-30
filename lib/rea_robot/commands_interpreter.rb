class CommandsInterpreter
  def initialize(commands_string, robot)
    @commands = commands_string.split("\n")
    @robot = robot
  end

  def process
    @commands.each do |command|
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
    end
  end

private

  def position_and_direction_from_place_command(command)
    position_and_direction_text = command.split(' ').last
    x, y, direction = position_and_direction_text.split(',')
    [x.to_i, y.to_i, direction]
  end
end