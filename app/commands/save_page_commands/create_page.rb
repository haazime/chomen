module SavePageCommands
  CreatePage = Struct.new(:gpid, :gcid, :content) do

    def run
      PageFactory.create_page(gpid, gcid, content).tap(&:save)
    end

    def render(controller)
      controller.render_for_create_page
    end
  end
end
