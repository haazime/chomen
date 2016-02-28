module SavePageCommands
  CreatePage = Struct.new(:content) do

    def run
      PageFactory.create(chunk).tap(&:save)
    end

    private

      def chunk
        Chunk.new(content: content)
      end
  end
end
