require 'rails_helper'

describe 'edit page', js: true do
  before do
    visit edit_page_path(gpid: saved_page.gpid)
  end

  let(:saved_page) { create_page('GPID', 1, 'CREATE') }

  describe 'saved content' do
    let(:content) { chunk_input(0).text }
    it { expect(content).to have_content('CREATE') }
  end

  describe 'update content' do
    before do
      chunk_input(0).set('UPDATED')
      wait_for_ajax
    end

    it do
      expect(saved_page.reload.chunks.last.content).to eq('UPDATED')
    end
  end
end
