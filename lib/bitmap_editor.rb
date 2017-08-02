# require_relative 'bitmap'
#
# class BitmapEditor
#
#   attr_accessor :image
#
#   def initialize
#     @image = nil
#     @error_handler = Proc.new { |msg| puts msg }
#   end
#
#   def run(file)
#     fail puts "Please provide an existing file" if file.nil? || !File.exists?(file)
#
#     File.open(file).each do |line|
#       line = line.chomp
#       command = line[0]
#       params = convert_params(line)
#       case command
#       when 'I'
#         create_bitmap(params)
#         puts "Creating new image"
#       when 'C'
#         if image_exists?
#           @image.clear
#           puts "Image cleared"
#         else
#           error_handler.call("There is no image to clear")
#         end
#       when 'S'
#         show
#         error_handler.call("There is no image")
#       when 'L'
#         colour_pixel(params)
#       when 'V'
#         colour_column(params)
#       when 'H'
#         colour_row(params)
#       else
#         error_handler.call('unrecognised command :(')
#       end
#     end
#
#   end
#
#   private
#
#   attr_reader :error_handler
#
#   def colour_pixel(params)
#     x, y, c = params
#     @image[x,y] = c
#   end
#
#   def colour_column(params)
#     x, y1, y2, c = params
#     @image.fill_column(x, y1, y2, c)
#   end
#
#   def colour_row(params)
#     x1, x2, y, c = params
#     @image.fill_row(x1, x2, y, c)
#   end
#
#   def show_image
#     puts @image.show
#   end
#
#   def image_exists?
#     !!@image
#   end
#
#   def convert_params(line)
#     params = line.split(/\s+/)
#     params.shift
#     params.map { |el| el.match(/\A[-+]?\d+\z/) ? el.to_i - 1 : el }
#   end
#
#   def create_bitmap(params)
#     rows, cols = params
#     @image = Bitmap.new(cols + 1, rows + 1)
#   end
#
# end
