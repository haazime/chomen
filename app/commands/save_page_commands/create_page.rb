module SavePageCommands
  CreatePage = Struct.new(:gpid, :number, :content) do
    include ResultRegisterable

    def run
      chunk = Chunk.new(number: number, content: content)
      page = Page.new(gpid: gpid)
      page.add_chunk(chunk)
      page.save
      register_result(page, chunk)
    end

    def render(controller)
      controller.render_for_create_page(result)
    end
  end
end
