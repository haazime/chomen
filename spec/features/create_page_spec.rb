require 'rails_helper'

describe 'create page', js: true do
  before do
    visit root_path
    find('#add-page').click
    fill_in 'chunk[content]', with: 'CREATE'
    form.trigger('submit')
    find('#state')
  end

  let(:form) { find('#chunk-form') }

  let(:saved_page) { Page.last }

  context 'first time' do
    it { expect(saved_page.chunk.content).to eq('CREATE') }
  end

  context 'continue to edit' do
    before do
      fill_in 'chunk[content]', with: 'UPDATE'
      form.trigger('submit')
      find('#state')
      sleep 0.3
    end

    it { expect(saved_page.chunk.reload.content).to eq('UPDATE') }
  end
end
