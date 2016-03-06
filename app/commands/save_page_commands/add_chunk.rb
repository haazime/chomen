module SavePageCommands
  AddChunk = Struct.new(:gpid, :number, :content) do

    def run
      page = Page.find_by_gpid(gpid)
      page.add_chunk(number, content)
      page.save
    end

    def render(controller)
      controller.render_for_update_chunk
    end
  end
end
