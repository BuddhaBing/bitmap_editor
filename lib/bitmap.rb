require 'matrix'

class Bitmap < Array

  attr_reader :pixels

  MIN_SIZE = 1
  MAX_SIZE = 250

  def self.new(cols, rows, colour = "O")
    validate(cols, rows)
    # super
    new(rows) { new(cols) }
  end

  def initialize(cols, rows, colour = "O")
    # @pixels = superclass.new(rows) { superclass.new(cols, colour) }
    @height = rows
    @width = cols
  end

  def column_count
    @width
  end

  def row_count
    @height
  end

  # def size
  #
  # end

  private

  def self.validate(rows, cols)
    raise "#{self} pixel width must be between #{MIN_SIZE} and #{MAX_SIZE}" if !valid?(rows)
    raise "#{self} pixel height must be between #{MIN_SIZE} and #{MAX_SIZE}" if !valid?(cols)
  end

  def self.valid?(pixels)
    pixels.between?(MIN_SIZE, MAX_SIZE)
  end

end
