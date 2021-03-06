require 'rails_helper'

describe 'Home', js: true do
  let(:content) { chunk_input(0).text }

  context 'no pages' do
    it do
      visit root_path
      expect(content).to eq('')
    end
  end

  context 'page exists' do
    it do
      page1 = create_page('PAGE1', 1, 'CHUNK')
      page2 = create_page('PAGE2', 1, 'CHUNK')

      update_chunk(page1.chunks.first.gcid, 'LAST UPDATE')

      visit root_path
      expect(content).to have_content('LAST UPDATE')
    end

    it do
      page1 = create_page('PAGE1', 1, 'PAGE1')
      page2 = create_page('PAGE2', 1, 'PAGE2')

      visit edit_page_path(gpid: page1.gpid)

      visit root_path
      expect(content).to have_content('PAGE1')
    end
  end
end
