class Bitmap

  attr_reader :pixels, :width, :height

  MIN_SIZE = 1
  MAX_SIZE = 250
  DEFAULT_COLOUR = 'O'.freeze

  def self.new(cols, rows, colour = DEFAULT_COLOUR)
    validate(cols, rows)
    super
  end

  def initialize(cols, rows, _colour = DEFAULT_COLOUR, array_class = Array)
    @height = rows
    @width = cols
    @array_class = array_class
    create
  end

  def []=(x, y, c)
    raise 'Out of bounds' unless in_range?(x, y)
    @pixels[y][x] = c
  end

  def [](x, y)
    raise 'Out of bounds' unless in_range?(x, y)
    @pixels[y][x]
  end

  def fill_column(x, y1, y2, c)
    raise 'Out of bounds' unless in_range?(x, y1) && in_range?(x, y2)
    y1.upto(y2) { |y| self[x, y] = c }
  end

  def fill_row(x1, x2, y, c)
    raise 'Out of bounds' unless in_range?(y, x1) && in_range?(y, x2)
    x1.upto(x2) { |x| self[x, y] = c }
  end

  def size
    "#{@width} x #{@height}"
  end

  def clear
    @pixels = array_class.new(@height) { array_class.new(@width, DEFAULT_COLOUR) }
  end

  def show
    @pixels.map { |row| row.join('') }.join("\n")
  end

  private

  attr_reader :array_class

  def self.validate(rows, cols)
    raise "#{self} pixel width must be between #{MIN_SIZE} and #{MAX_SIZE}" unless valid?(rows)
    raise "#{self} pixel height must be between #{MIN_SIZE} and #{MAX_SIZE}" unless valid?(cols)
  end

  def self.valid?(pixels)
    pixels.between?(MIN_SIZE, MAX_SIZE)
  end

  def in_range?(x, y)
    x += 1
    y += 1
    !(x < MIN_SIZE || y < MIN_SIZE || x > width || y > height)
  end

  alias create clear
  
end
