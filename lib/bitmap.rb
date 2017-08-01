require 'matrix'

class Bitmap < Matrix

  MIN_SIZE = 1
  MAX_SIZE = 250

  def self.new(rows, cols)
    build(rows, cols)
  end

  def self.build(rows, cols)
    validate(rows, cols)
    super
  end

  private

  def self.validate(rows, cols)
    raise "#{self} pixel width must be between #{MIN_SIZE} and #{MAX_SIZE}" if !valid?(rows)
    raise "#{self} pixel height must be between #{MIN_SIZE} and #{MAX_SIZE}" if !valid?(cols)
  end

  def self.valid?(pixels)
    pixels.between?(MIN_SIZE, MAX_SIZE)
  end

end
