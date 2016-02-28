module SavePageCommands
  CreatePage = Struct.new(:content) do

    def run
      PageFactory.create(chunk).tap(&:save)
    end

    def render(controller)
      controller.render_for_create_page
    end

    private

      def chunk
        Chunk.new(content: content)
      end
  end
end
