module SavePageHelper

  def create_page(gpid, gcid, chunk_content)
    cmd = SavePageCommands::CreatePage.new(gpid, gcid, chunk_content)
    cmd.run
    cmd.result.page
  end

  def update_chunk(gcid, content)
    cmd = SavePageCommands::UpdateChunk.new(gcid, content)
    cmd.run
    cmd.result.chunk
  end

  def add_chunk(gpid, gcid, chunk_content)
    cmd = SavePageCommands::AddChunk.new(gpid, gcid, chunk_content)
    cmd.run
    cmd.result.chunk
  end
end

RSpec.configure do |config|
  config.include SavePageHelper
end
