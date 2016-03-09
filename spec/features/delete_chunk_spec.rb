require 'rails_helper'

describe 'delete chunk' do
  let(:saved_page) { create_page('GPID', 1, 'CHUNK1') }

  context 'page=1, chunk=1' do
    it do
      visit edit_page_path(gpid: saved_page.gpid)
      delete_chunk_button(1).click

      visit edit_page_path(gpid: saved_page.gpid)
      expect(page.status_code).to eq(404)
    end
  end

  skip 'page=1, chunk=2' do
    before do
      add_chunk(saved_page.gpid, 2, 'CHUNK2')
    end

    it do
      visit edit_page_path(gpid: saved_page.gpid)
      delete_chunk_button(1).click

      aggregate_failures do
        expect(Page.count).to eq(0)
        expect(Chunk.count).to eq(0)
      end
    end
  end
end
