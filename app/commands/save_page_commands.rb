require 'save_page_commands/update_chunk'
require 'save_page_commands/create_page'

module SavePageCommands
  class << self

    def detect(params)
      return UpdateChunk.new(params[:gcid], params[:content]) if page_exist?(params[:gpid])
      CreatePage.new(params[:gpid], params[:content])
    end

    private

      def page_exist?(gpid)
        Page.find_by_gpid(gpid)
      end
  end
end
