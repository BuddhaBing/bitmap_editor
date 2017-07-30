require_relative 'bitmap'

class BitmapEditor

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
      when 'S'
          puts "There is no image"
      else
          puts 'unrecognised command :('
      end
    end

  end

  private

  def convert_params(line)
    params = line.gsub(/(^\w)|\s/, "").split("")
    params.map { |el| el.match(/\A[-+]?\d+\z/) ? el.to_i - 1 : el }
  end

  def create_bitmap(params)
    rows, cols = params
    @image = Bitmap.new(rows + 1, cols + 1)
  end

end
