require 'rails_helper'

describe 'delete chunk' do
  let(:saved_page) { create_page('GPID', 1, 'CREATE') }

  it do
    visit edit_page_path(gpid: saved_page.gpid)
    delete_chunk_button(1).click

    aggregate_failures do
      expect(Page.count).to eq(0)
      expect(Chunk.count).to eq(0)
    end
  end
end
