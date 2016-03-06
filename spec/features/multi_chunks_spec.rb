require 'rails_helper'

describe 'multi chunks on page' do
  it do
    page = create_page('GPID', 1, 'CHUNK1 INIT')
    add_chunk(page.gpid, 2, 'CHUNK2')
    add_chunk(page.gpid, 3, 'CHUNK3')
    update_chunk(page.chunk(1).gcid, 'CHUNK1')

    visit edit_page_path(gpid: page.gpid)
    chunk_contents = all('textarea.content').map(&:text)
    expect(chunk_contents).to eq(%w(CHUNK1 CHUNK2 CHUNK3))
  end
end
