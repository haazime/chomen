require 'rails_helper'

describe PageFactory do
  describe '.create' do
    it do
      gpid = 'GPID'
      gpid_generator = double(:gpid_generator)
      allow(gpid_generator).to receive(:generate).and_return(gpid)

      page = described_class.create(gpid_generator)

      aggregate_failures do
        expect(page).to_not be_persisted
        expect(page.gpid).to eq(gpid)
      end
    end

    it do
      gpid = 'GPID'
      gpid_generator = double(:gpid_generator)
      allow(gpid_generator).to receive(:generate).and_return(gpid)

      page = described_class.create(gpid_generator)
      chunk = page.chunk

      aggregate_failures do
        expect(chunk).to_not be_persisted
        expect(chunk.content).to be_nil
      end
    end
  end
end
