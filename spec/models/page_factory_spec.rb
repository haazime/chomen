require 'rails_helper'

describe PageFactory do
  describe '.new_page' do
    it do
      page = described_class.new_page
      chunk = page.chunk

      aggregate_failures do
        expect(page).to_not be_persisted
        expect(page.gpid).to be_nil
        expect(chunk).to_not be_persisted
        expect(chunk.content).to be_nil
      end
    end
  end

  describe '.create' do
    let(:gpid_generator) do
      double(:gpid_generator).tap do |d|
        allow(d).to receive(:generate).and_return(gpid)
      end
    end

    let(:gpid) { 'GPID' }
    let(:chunk) { Chunk.new(content: 'CONTENT') }

    it do
      page = described_class.create(chunk, gpid_generator)
      created_chunk = page.chunk

      aggregate_failures do
        expect(page).to_not be_persisted
        expect(page.gpid).to eq(gpid)
        expect(created_chunk.content).to eq('CONTENT')
      end
    end
  end
end
