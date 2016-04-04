require 'rails_helper'

describe 'create page', js: true do
  before do
    visit new_page_path
    form.first('textarea').set('CREATE')
    form.trigger('submit')
    wait_for_ajax
  end

  let(:form) { chunk_form(1) }
  let(:saved_page) { Page.last }

  context 'first time' do
    it { expect(saved_page.chunks.last.content).to eq('CREATE') }
    it { expect(delete_chunk_button(1)).to_not be_nil }
  end

  context 'continue to edit' do
    before do
      form.first('textarea').set('UPDATE')
      form.trigger('submit')
      wait_for_ajax
      saved_page.chunks.reload
    end

    it { expect(saved_page.chunks.last.content).to eq('UPDATE') }
  end
end
