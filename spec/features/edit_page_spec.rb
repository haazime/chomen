require 'rails_helper'

describe 'edit page' do
  before { visit edit_page_path(gpid: saved_page.gpid) }

  let(:saved_page) { create_page('GPID', 1, 'CREATE') }
  let(:form) { chunk_form(1) }

  describe 'saved content' do
    let(:content) { form.first('textarea').value }
    it { expect(content).to have_content('CREATE') }
  end

  describe 'update content', js: true do
    before do
      form.first('textarea').set('UPDATED')
      form.trigger('submit')
      wait_for_ajax
    end

    it do
      expect(saved_page.reload.chunks.last.content).to eq('UPDATED')
    end
  end
end
