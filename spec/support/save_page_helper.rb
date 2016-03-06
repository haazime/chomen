module SavePageHelper

  def create_page(gpid, chunk_number, chunk_content)
    cmd = SavePageCommands::CreatePage.new(gpid, chunk_number, chunk_content)
    cmd.run
    cmd.result.page
  end

  def update_chunk(gcid, content)
    cmd = SavePageCommands::UpdateChunk.new(gcid, content)
    cmd.run
    cmd.result.chunk
  end

  def add_chunk(gpid, chunk_number, chunk_content)
    cmd = SavePageCommands::AddChunk.new(gpid, chunk_number, chunk_content)
    cmd.run
    cmd.result.chunk
  end
end
