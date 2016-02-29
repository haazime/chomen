require 'rails_helper'

describe 'edit page' do
  before { visit edit_page_path(gpid: saved_page.gpid) }

  let(:saved_page) { SavePageCommands::CreatePage.new('CREATE').run }
  let(:form) { find(css_eid(:chunk, 0)) }

  describe 'saved content' do
    let(:content) { form.first('textarea').value }
    it { expect(content).to have_content('CREATE') }
  end

  describe 'update content', js: true do
    before do
      fill_in 'chunk[content]', with: 'UPDATED'
      form.trigger('submit')
      wait_save
    end

    it do
      expect(saved_page.reload.chunk.content).to eq('UPDATED')
    end
  end
end
