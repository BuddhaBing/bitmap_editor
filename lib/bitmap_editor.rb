require_relative 'bitmap'

class BitmapEditor

  attr_reader :image

  def initialize
    @image = nil
    @error_handler = Proc.new { |msg| puts msg }
  end

  def run(file)
    return puts "Please provide an existing file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp
      command = line[0]
      params = convert_params(line)
      case command
      when 'I'
        create_bitmap(params)
        puts "Creating new image"
      when 'C'
        if image_exists?
          @image.clear
          puts "Image cleared"
        else
          error_handler.call("There is no image to clear")
        end
      when 'S'
        error_handler.call("There is no image")
      else
        error_handler.call('unrecognised command :(')
      end
    end

  end

  private

  attr_reader :error_handler

  def image_exists?
    !!@image
  end

  def convert_params(line)
    params = line.split(/\s+/)
    params.shift
    params.map { |el| el.match(/\A[-+]?\d+\z/) ? el.to_i - 1 : el }
  end

  def create_bitmap(params)
    rows, cols = params
    @image = Bitmap.new(rows + 1, cols + 1, error_handler)
  end

end
