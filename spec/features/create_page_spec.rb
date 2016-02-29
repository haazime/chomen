require 'rails_helper'

describe 'create page', js: true do
  before do
    visit new_page_path
    fill_in 'chunk[content]', with: 'CREATE'
    form.trigger('submit')
    wait_save
  end

  let(:form) { find(css_eid(:chunk, 0)).find('form') }
  let(:saved_page) { Page.last }

  context 'first time' do
    it { expect(saved_page.chunk.content).to eq('CREATE') }
    it { expect(delete_chunk_button).to_not be_nil }
  end

  context 'continue to edit' do
    before do
      fill_in 'chunk[content]', with: 'UPDATE'
      form.trigger('submit')
      wait_save
      sleep 0.3
    end

    it { expect(saved_page.chunk.reload.content).to eq('UPDATE') }
  end
end
