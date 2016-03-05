require 'rails_helper'

describe 'add chunk' do
  skip do
  before { visit edit_page_path(gpid: saved_page.gpid) }
  let(:saved_page) { SavePageCommands::CreatePage.new('GPID', 'GCID', 'CREATE').run }

  it do
    chunk_segment(1).first('.add-chunk-to-down').click
    wait_for_chunk_count(2)
    chunk_form(2).first('textarea').set('CHUNK2')
    chunk_form(2).trigger('submit')
    wait_for_ajax
    expect(saved_page.chunks[1].content).to eq('CHUNK2')
  end
  end
end
