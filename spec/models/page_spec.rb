require 'rails_helper'

describe Page do
  describe '#add_chunk' do
    it do
      page = Page.new(gpid: 'GPID')
      page.add_chunk(1, 'CONTENT')
      chunk = page.chunk

      aggregate_failures do
        expect(chunk.gpid).to eq('GPID')
        expect(chunk.gcid).to_not be_nil
        expect(chunk.number).to eq(1)
        expect(chunk.content).to eq('CONTENT')
      end
    end
  end
end
