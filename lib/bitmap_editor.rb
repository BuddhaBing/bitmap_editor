require_relative 'bitmap'
require_relative 'parser'
require_relative 'file_reader'
require_relative 'error_handler'
require_relative 'cli'

class BitmapEditor

  include FileReader

  BAD_COMMAND = 'Bad command :('
  UNKNOWN_COMMAND = 'Unknown command :('

  def run(file)
    read(file)
  end

  private

  attr_reader :image

  def execute(command, params)
    CLI.interpreter(command)
    begin
      fail ArgumentError, UNKNOWN_COMMAND if !command
      params.empty? ? send(command) : send(command, params)
      CLI.output("Success!\n\n")
    rescue ArgumentError => ex
      ErrorHandler.error("#{ex.message}")
    rescue NoMethodError
      ErrorHandler.error(BAD_COMMAND)
    end
    check_image_exists
  end

  def check_image_exists
    begin
      fail ArgumentError, 'There is no image...' unless image_exists?
    rescue ArgumentError => ex
      ErrorHandler.error("#{ex.message}\n\n")
    end
  end

  def create(params)
    cols, rows = params
    @image = Bitmap.new(cols + 1, rows + 1)
  end

  def colour_pixel(params)
    x, y, c = params
    image[x,y] = c
  end

  def colour_column(params)
    x, y1, y2, c = params
    image.fill_column(x, y1, y2, c)
  end

  def colour_row(params)
    x1, x2, y, c = params
    image.fill_row(x1, x2, y, c)
  end

  def show
    CLI.output(image.show + "\n\n")
  end

  def clear
    image.clear
  end

  def image_exists?
    !!image
  end

end
