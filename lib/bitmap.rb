class Bitmap

  attr_reader :pixels, :width, :height

  MIN_SIZE = 1
  MAX_SIZE = 250
  DEFAULT_COLOUR = 'O'

  def self.new(cols, rows, colour = DEFAULT_COLOUR)
    validate(cols, rows)
    super
  end

  def initialize(cols, rows, colour = "O")
    @height = rows
    @width = cols
    @pixels = Array.new(rows) { Array.new(cols, colour) }
  end

  def []=(x,y,c)
    raise "Out of bounds" unless in_range?(x, y)
    @pixels[y][x] = c
  end

  def [](x,y)
    raise "Out of bounds" unless in_range?(x, y)
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

  def in_range?(x, y)
    !(x < MIN_SIZE || y < MIN_SIZE || x > width || y > height)
  end

end
