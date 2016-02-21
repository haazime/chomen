require 'rails_helper'

describe 'edit page' do
  before do
    page = Page.new_with_chunk(chunk)
    page.save
    visit edit_page_path(gpid: page.gpid)
  end

  let(:chunk) { Chunk.new(content: 'NOTE') }

  let(:saved_content) do
    find("#edit_chunk_#{chunk.id}").first('textarea').text
  end

  it { expect(saved_content).to have_content('NOTE') }
end
