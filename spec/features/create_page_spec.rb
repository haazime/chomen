require 'rails_helper'

describe 'create page', js: true do
  before do
    visit new_page_path
    chunk_input(0).set('CREATE')
    wait_for_ajax
  end

  let(:saved_page) { Page.last }

  context 'first time' do
    it { expect(saved_page.chunks.last.content).to eq('CREATE') }
  end

  context 'continue to edit' do
    before do
      chunk_input(0).set('UPDATE')
      wait_for_ajax
      saved_page.chunks.reload
    end

    it { expect(saved_page.chunks.last.content).to eq('UPDATE') }
  end
end
