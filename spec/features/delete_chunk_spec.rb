require 'rails_helper'

describe 'delete chunk' do
  let(:saved_page) { SavePageCommands::CreatePage.new('GPID', 'GCID', 'CREATE').run }
  let(:saved_chunk) { saved_page.chunk }

  it do
    visit edit_page_path(gpid: saved_page.gpid)
    delete_chunk_button.click;

    deleted_chunk = Chunk.find_by(id: saved_chunk.id)
    deleted_page = Page.find_by(gpid: saved_page.gpid)

    aggregate_failures do
      expect(deleted_chunk).to be_nil
      expect(deleted_page).to be_nil
    end
  end
end
