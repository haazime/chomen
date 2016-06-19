require 'rails_helper'

describe 'add chunk', js: true do
  before do
    visit edit_page_path(gpid: saved_page.gpid)
  end

  let(:saved_page) { create_page('GPID', 'GCID1', 'CHUNK1') }

  it do
    chunk_adder.click
    wait_for_ajax
    chunk_input(1).set('CHUNK2')
    wait_for_ajax
    expect(saved_page.chunks.reload.last.content).to eq('CHUNK2')
  end
end
