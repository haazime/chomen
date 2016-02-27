require 'rails_helper'

describe 'edit page' do
  before { visit edit_page_path(gpid: saved_page.gpid) }

  let(:saved_page) { PageFactory.build_with_chunk(gpid, chunk).tap(&:save) }
  let(:gpid) { 'GPID' }
  let(:chunk) { Chunk.new(content: 'SAVED') }
  let(:form) { find("#chunk-form") }

  describe 'saved content' do
    let(:content) { form.first('textarea').value }
    it { expect(content).to have_content('SAVED') }
  end

  describe 'update content', js: true do
    before do
      fill_in 'chunk[content]', with: 'UPDATED'
      form.trigger('submit')
      find('#state')
    end

    it do
      expect(saved_page.reload.chunk.content).to eq('UPDATED')
    end
  end
end
