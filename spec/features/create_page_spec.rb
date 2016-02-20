require 'rails_helper'

describe 'create page', js: true do
  it do
    visit new_page_path
    fill_in 'chunk[content]', with: 'note'
    find('#new_chunk').trigger('submit')

    find('#state')
    chunk = Chunk.last
    content = find("#edit_chunk_#{chunk.id}").first('textarea').text
    expect(content).to eq('note')
  end
end
