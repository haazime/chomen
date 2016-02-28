module SavePageCommands
  UpdateChunk = Struct.new(:gpid, :id, :content) do

    def run
      page.tap { |p| p.chunk.update(content: content) }
    end

    def render(controller)
      controller.render_for_update_chunk
    end

    private

      def page
        Page.find_by_gpid(gpid)
      end
  end
end
