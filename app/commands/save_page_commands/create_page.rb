module SavePageCommands
  CreatePage = Struct.new(:gpid, :gcid, :content) do
    include ResultRegisterable

    def run
      page = Page.new(gpid: gpid)
      page.add_chunk(gcid, content)
      page.save!
      register_result(page, page.chunks.last)
    end

    def render(controller)
      controller.render_for_save(result)
    end
  end
end
