module SavePageCommands
  CreatePage = Struct.new(:gpid, :content) do

    def run
      PageFactory.build_with_chunk(gpid, chunk).tap(&:save)
    end

    private

      def chunk
        Chunk.new(content: content)
      end
  end
end
