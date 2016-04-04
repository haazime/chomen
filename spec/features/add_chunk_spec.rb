require 'rails_helper'

describe 'add chunk', js: true do
  before { visit edit_page_path(gpid: saved_page.gpid) }
  let(:saved_page) { create_page('GPID', 'GCID1', 'CHUNK1') }

  it do
    first('#chunk-adder').click
    wait_for_ajax
    chunk_form(2).first('textarea').set('CHUNK2')
    chunk_form(2).trigger('submit')
    wait_for_ajax
    expect(saved_page.chunks.reload.last.content).to eq('CHUNK2')
  end
end
