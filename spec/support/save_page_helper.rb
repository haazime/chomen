module SavePageHelper

  def create_page(gpid, chunk_number, chunk_content)
    cmd = SavePageCommands::CreatePage.new('GPID', 1, 'CREATE')
    cmd.run
    cmd.result.page
  end
end
