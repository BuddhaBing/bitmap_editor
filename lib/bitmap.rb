class Bitmap

  attr_reader :data

  def initialize(cols, rows)
    @data = nil
    @rows = rows
    @cols = cols
    clear
  end

  def clear
    @data = Array.new(@rows) { Array.new(@cols, 'O') }
  end

end
