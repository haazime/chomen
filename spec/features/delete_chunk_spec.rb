require 'rails_helper'

describe 'delete chunk', js: true do
  let(:saved_page) { create_page('GPID', 1, 'CHUNK1') }

  context 'page=1, chunk=1' do
    it do
      visit edit_page_path(gpid: saved_page.gpid)
      chunk_remover(0).click
      visit edit_page_path(gpid: saved_page.gpid)
      expect(page.status_code).to eq(404)
    end
  end

  context 'page=1, chunk=2' do
    before do
      add_chunk(saved_page.gpid, 2, 'CHUNK2')
    end

    it do
      visit edit_page_path(gpid: saved_page.gpid)
      chunk_remover(0).click
      visit edit_page_path(gpid: saved_page.gpid)
      expect(chunk_input(0).text).to eq('CHUNK2')
    end
  end
end
