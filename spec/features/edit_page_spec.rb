require 'rails_helper'

__END__
describe 'edit page' do
  before do
    chunk_params = { gpid: 'GPID', id: nil, content: 'CONTENT' }
    page = PageFactory.build_from_chunk().tap { |p| p.save }
    visit edit_page_path(gpid: page.gpid)
  end

  let(:form) { find("#edit_chunk_#{chunk.id}") }

  describe 'saved content' do
    let(:saved_content) { edit_form.first('textarea').text }
    it { expect(saved_content).to have_content('SAVED_NOTE') }
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
