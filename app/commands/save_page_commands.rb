module SavePageCommands
  module_function

  def detect(params)
    return UpdateChunk.new(params[:gpid], params[:id], params[:content]) if params[:id].present?
    CreatePage.new(params[:gpid], params[:content])
  end
end
