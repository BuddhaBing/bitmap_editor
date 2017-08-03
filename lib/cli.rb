module CLI

  MESSAGES = {
    'create' => 'Creating new image...',
    'colour_pixel' => 'Pixel coloured',
    'colour_column' => 'Vertical pixel range coloured',
    'colour_row' => 'Horizontal pixel range coloured',
  }.freeze

  def self.interpreter(command)
    output(MESSAGES[command]) if MESSAGES[command]
  end

  def self.output(msg)
    puts msg
  end

end
