require 'rails_helper'

describe 'create page', js: true do
  before do
    visit root_path
    find('#add-page').click
    fill_in 'chunk[content]', with: 'CREATE'
    form.trigger('submit')
    find('.state')[0]
  end

  let(:form) { first('.chunk-form') }

  let(:saved_page) { Page.last }

  context 'first time' do
    it { expect(saved_page.chunk.content).to eq('CREATE') }

    it do
      delete_button = first('.delete-chunk')
      expect(delete_button).to_not be_nil
    end
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
