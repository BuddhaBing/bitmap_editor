class Bitmap

  attr_reader :data

  def initialize(cols, rows, error_strategy = method(:raise))
    @error_strategy = error_strategy
    @data = nil
    @rows = rows
    @cols = cols
    create
  end

  def create
    raise err = "Invalid Request: Row and Column size must be between 1 and 250" if !valid?
    @data = Array.new(@rows) { Array.new(@cols, 'O') }
  rescue
    error_strategy.call(err)
  end

  private

  attr_reader :rows, :cols, :error_strategy

  def valid?
    rows.between?(1, 250) && cols.between?(1, 250)
  end

  alias clear create

end
