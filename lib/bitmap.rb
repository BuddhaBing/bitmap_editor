class Bitmap

  attr_reader :pixels

  def initialize(cols, rows, error_strategy = method(:raise))
    @error_strategy = error_strategy
    @pixels = nil
    @rows = rows
    @cols = cols
    create
  end

  def create
    raise err = "Invalid Request: Row and Column size must be between 1 and 250" if !valid?
    pixels
  rescue
    error_strategy.call(err)
  end

  def pixels
    @pixels ||= (1..rows).map{ (1..cols).map{'O'} }
  end

  private

  attr_reader :rows, :cols, :error_strategy

  def valid?
    rows.between?(1, 250) && cols.between?(1, 250)
  end

  alias clear create

end
