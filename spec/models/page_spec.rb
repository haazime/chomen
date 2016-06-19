require 'rails_helper'

describe Page do
  describe '#add_chunk' do
    it do
      page = Page.new(gpid: 'GPID')
      page.add_chunk('GCID', 'CONTENT')
      added_chunk = page.chunks.last

      aggregate_failures do
        expect(added_chunk.gpid).to eq('GPID')
        expect(added_chunk.gcid).to eq('GCID')
        expect(added_chunk.content).to eq('CONTENT')
      end
    end
  end

  describe '#ordered_chunks' do
    it do
      page = Page.new(gpid: 'GPID')
      page.add_chunk('GCID1', 'chunk1')
      page.save
      page.add_new_chunk
      ordered_chunks = page.ordered_chunks

      aggregate_failures do
        expect(ordered_chunks.size).to eq(2)
        expect(ordered_chunks.first.gcid).to eq('GCID1')
      end
    end
  end
end
