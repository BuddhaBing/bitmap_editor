module FileReader

  def read(file)

    return ErrorHandler.error('Please provide an existing file') if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      command, params = Parser.parse(line.chomp)
      execute(command, params)
    end

  end

end
