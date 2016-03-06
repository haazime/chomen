module SavePageCommands
  module ResultRegisterable
    Result = Struct.new(:page, :chunk)

    attr_reader :result

    def register_result(page, chunk)
      @result = Result.new(page, chunk)
    end
  end
end
