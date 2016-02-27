require 'rails_helper'

describe Page do
  describe '#chunk' do
    it do
      page = Page.new
      chunk = Chunk.create(page_id: 1, content: 'CONTENT')
      page.chunks << chunk
      expect(page.chunk).to eq(chunk)
    end
  end
end
