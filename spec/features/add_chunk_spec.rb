require 'rails_helper'

describe 'add chunk', js: true do
  before { visit edit_page_path(gpid: saved_page.gpid) }
  let(:saved_page) { SavePageCommands::CreatePage.new('GPID', 1, 'CREATE').run }

  it do
    first('a[data-chunk-adder]').click
    wait_for_chunk_count(2)
    chunk_form(2).first('textarea').set('CHUNK2')
    chunk_form(2).trigger('submit')
    wait_for_ajax
    expect(saved_page.chunks.last.content).to eq('CHUNK2')
  end
end
