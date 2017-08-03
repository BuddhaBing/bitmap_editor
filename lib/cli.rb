module CLI

  MESSAGES = {
    'create' => 'Creating new image...',
    'colour_pixel' => 'Colouring pixel...',
    'colour_column' => 'Colouring vertical pixel range...',
    'colour_row' => 'Colouring horizontal pixel range...',
    'clear' => 'Clearing image...',
    'show' => 'Displaying image...'
  }.freeze

  def self.interpreter(command)
    output(MESSAGES[command]) if MESSAGES[command]
  end

  def self.output(msg)
    puts msg
  end

end
