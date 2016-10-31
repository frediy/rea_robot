module Direction
  DIRECTION_STRINGS_TO_DIRECTION_VECTORS = {
    'NORTH' => Vector[0, 1],
    'EAST'  => Vector[1, 0],
    'SOUTH' => Vector[0, -1],
    'WEST'  => Vector[-1, 0]
  }

  def direction_vector_from_direction_string(str)
    DIRECTION_STRINGS_TO_DIRECTION_VECTORS[str]
  end
end