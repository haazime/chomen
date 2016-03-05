require 'save_page_commands/create_page'
require 'save_page_commands/update_chunk'
require 'save_page_commands/add_chunk'

module SavePageCommands
  class << self

    def detect(params)
      return update_page(params) if page_exist?(params[:gpid])
      create_page(params)
    end

    def create_page(params)
      CreatePage.new(params[:gpid], params[:content])
    end

    def update_page(params)
      return UpdateChunk.new(params[:gcid], params[:content]) if params[:gcid].present?
      AddChunk.new(params[:gpid], params[:content])
    end

    private

      def page_exist?(gpid)
        Page.find_by_gpid(gpid)
      end
  end
end
