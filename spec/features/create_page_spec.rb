require 'rails_helper'

describe 'create page', js: true do
  let(:content) { 'CONTENT' }

  before do
    visit root_path
    find('#add-page').click
    fill_in 'chunk[content]', with: content
    find('#chunk-form').trigger('submit')
    find('#state')
  end

  it do
    created_chunk = Page.last.chunk
    expect(created_chunk.content).to eq(content)
  end
end
