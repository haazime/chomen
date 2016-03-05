require 'rails_helper'

describe 'add chunk' do
  before { visit edit_page_path(gpid: saved_page.gpid) }
  let(:saved_page) { SavePageCommands::CreatePage.new('GPID', 'CREATE').run }

  it do
    chunk_segment(1).first('a[data-chunk-adder]').click
    wait_for_chunk_count(2)
    chunk_form(2).first('textarea').set('CHUNK2')
    chunk_form(2).trigger('submit')
    wait_for_ajax
    expect(saved_page.chunks[1].content).to eq('CHUNK2')
  end
end
