require_relative 'cli'

module ErrorHandler

  include CLI

  def self.error(err)
    fail ArgumentError, err
  rescue
    CLI.output(err)
  end

end
