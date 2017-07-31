class Bitmap

  attr_reader :data

  def initialize(cols, rows)
    @data = nil
    @rows = rows
    @cols = cols
    create
  end

  def create
    @data = Array.new(@rows) { Array.new(@cols, 'O') }
  end

  alias clear create

end
