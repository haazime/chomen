require 'rails_helper'

describe 'edit page' do
  before do
    page = PageFactory.build_with_chunk(gpid, chunk).tap(&:save)
    visit edit_page_path(gpid: page.gpid)
  end

  let(:gpid) { 'GPID' }
  let(:chunk) { Chunk.new(content: 'SAVED') }
  let(:form) { find("#content-form") }

  describe 'saved content' do
    let(:content) { form.first('textarea').value }
    it { expect(content).to have_content(chunk.content) }
  end

  skip 'update content', js: true do
    before do
      fill_in 'chunk[content]', with: 'UPDATED_NOTE'
      edit_form.trigger('submit')
      find('#state')
    end

    let(:updated_content) { edit_form.first('textarea').value }

    it { expect(updated_content).to eq('UPDATED_NOTE') }
  end
end
