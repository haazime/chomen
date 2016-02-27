require 'rails_helper'

describe 'edit page' do
  skip do
  before do
    page = PageFactory.create(chunk).tap { |p| p.save }
    visit edit_page_path(gpid: page.gpid)
  end

  let(:chunk) { Chunk.new(content: 'SAVED_NOTE') }
  let(:edit_form) { find("#edit_chunk_#{chunk.id}") }

  describe 'saved content' do
    let(:saved_content) { edit_form.first('textarea').text }
    it { expect(saved_content).to have_content('SAVED_NOTE') }
  end

  describe 'update content', js: true do
    before do
      fill_in 'chunk[content]', with: 'UPDATED_NOTE'
      edit_form.trigger('submit')
      find('#state')
    end

    let(:updated_content) { edit_form.first('textarea').value }

    it { expect(updated_content).to eq('UPDATED_NOTE') }
  end
  end
end
