require 'rails_helper'

describe 'create page', js: true do
  before do
    visit new_page_path
    fill_in 'chunk[content]', with: 'NEW_NOTE'
    find('#new_chunk').trigger('submit')
    find('#state')
  end

  let(:created_content) do
    find("#edit_chunk_#{Chunk.last.id}").first('textarea').value
  end

  it { expect(created_content).to eq('NEW_NOTE') }
end
