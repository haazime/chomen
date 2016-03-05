module SavePageCommands
  AddChunk = Struct.new(:gpid, :content) do

    def run
      page = Page.find_by_gpid(gpid)
      page.add_chunk(content)
      page.save
    end

    def render(controller)
      controller.render_for_update_chunk
    end
  end
end
