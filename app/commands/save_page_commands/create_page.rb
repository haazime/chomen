module SavePageCommands
  CreatePage = Struct.new(:gpid, :content) do

    def run
      Page.new(gpid: gpid) do |page|
        page.add_chunk(content)
        page.save
      end
    end

    def render(controller)
      controller.render_for_create_page
    end
  end
end
