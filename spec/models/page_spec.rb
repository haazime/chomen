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
end
