module SavePageCommands
  UpdateChunk = Struct.new(:gpid, :id, :content) do

    def run
      page.tap { |p| p.chunk.update(content: content) }
    end

    private

      def page
        Page.find_by_gpid(gpid)
      end
  end
end
