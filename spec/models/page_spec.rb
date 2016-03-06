require 'rails_helper'

describe Page do
  describe '#add_chunk' do
    it do
      page = Page.new(gpid: 'GPID')
      chunk = Chunk.new(number: 1, content: 'CONTENT')
      page.add_chunk(chunk)
      added_chunk = page.chunks.last

      aggregate_failures do
        expect(added_chunk.gpid).to eq('GPID')
        expect(added_chunk.gcid).to_not be_nil
        expect(added_chunk.number).to eq(1)
        expect(added_chunk.content).to eq('CONTENT')
      end
    end
  end
end
