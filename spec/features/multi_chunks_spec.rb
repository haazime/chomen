require 'rails_helper'

xdescribe 'multi chunks on page' do
  it do
    page = create_page('GPID', 'GCID1', 'CHUNK1 INIT')
    add_chunk(page.gpid, 'GCID2', 'CHUNK2')
    add_chunk(page.gpid, 'GCID3', 'CHUNK3')
    update_chunk(page.chunks.first.gcid, 'CHUNK1')

    visit edit_page_path(gpid: page.gpid)
    chunk_contents = all('textarea.content').map(&:text)
    expect(chunk_contents).to eq(%w(CHUNK1 CHUNK2 CHUNK3))
  end
end
