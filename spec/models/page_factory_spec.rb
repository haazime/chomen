require 'rails_helper'

describe PageFactory do
  let(:gpid) { 'GPID' }

  describe '.create' do
    let(:gpid_generator) do
      double(:gpid_generator).tap do |d|
        allow(d).to receive(:generate).and_return(gpid)
      end
    end

    it do
      page = described_class.create(gpid_generator)
      chunk = page.chunk

      aggregate_failures do
        expect(page).to_not be_persisted
        expect(page.gpid).to eq(gpid)
        expect(chunk).to_not be_persisted
        expect(chunk.content).to be_nil
      end
    end
  end

  describe '.build_from_chunk' do
    let(:chunk_params) { { gpid: gpid, id: nil, content: 'CONTENT' } }

    it do
      page = described_class.build_from_chunk(chunk_params)
      chunk = page.chunk

      aggregate_failures do
        expect(page).to_not be_persisted
        expect(page.gpid).to eq(gpid)
        expect(chunk.content).to eq('CONTENT')
      end
    end
  end
end
