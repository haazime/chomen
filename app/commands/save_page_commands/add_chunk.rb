module SavePageCommands
  AddChunk = Struct.new(:gpid, :number, :content) do
    include ResultRegisterable

    def run
      chunk = Chunk.new(number: number, content: content)
      page = Page.find_by_gpid(gpid)
      page.add_chunk(chunk)
      page.save
      register_result(page, chunk)
    end

    def render(controller)
      controller.render_for_update_chunk(result)
    end
  end
end
