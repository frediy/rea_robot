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
      else # PLACE
        position_and_direction_text = command.split(' ').last
        x, y, direction = position_and_direction_text.split(',')
        x = x.to_i
        y = y.to_i
        @robot.place(x, y, direction)
      end
    end
  end

  def output
    @robot.position_and_direction_text
  end
end