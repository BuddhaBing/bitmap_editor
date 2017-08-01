require 'matrix'

class Bitmap < Matrix

  attr_reader :pixels

  def []=(x, y, c)
    @rows[y][x] = c
  end

  def fill_column(x, y1, y2, c)
    y1.upto(y2) { |y| self[x,y] = c }
  end

  def fill_row(x1, x2, y, c)
    x1.upto(x2) { |x| self[x,y] = c }
  end

  def pixels
    @pixels ||= (1..rows).map{ (1..cols).map{'O'} }
  end

  private

  attr_reader :rows, :cols, :error_strategy

  def valid?
    rows.between?(1, 250) && cols.between?(1, 250)
  end

end
