class Bitmap

  attr_reader :pixels, :width, :height

  MIN_SIZE = 1
  MAX_SIZE = 250

  def self.new(cols, rows, colour = "O")
    validate(cols, rows)
    super
  end

  def initialize(cols, rows, colour = "O")
    @height = rows
    @width = cols
    @pixels = Array.new(rows) { Array.new(cols, colour) }
  end

  def []=(x,y,c)
    @pixels[y][x] = c
  end

  def [](x,y)
    @pixels[y][x]
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
