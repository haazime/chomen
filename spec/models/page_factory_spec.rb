require 'rails_helper'

describe PageFactory do
  let(:factory) do
    described_class.new(gpid_generator, gcid_generator)
  end

  let(:gpid_generator) do
    double(:gpid_generator).tap do |d|
      allow(d).to receive(:generate).and_return(gpid)
    end
  end

  let(:gcid_generator) do
    double(:gcid_generator).tap do |d|
      allow(d).to receive(:generate).and_return(gcid)
    end
  end

  let(:gpid) { 'GPID' }
  let(:gcid) { 'GCID' }

  describe '#new_page' do
    it do
      page = factory.new_page
      chunk = page.chunk

      aggregate_failures do
        expect(page).to_not be_persisted
        expect(page.gpid).to eq(gpid)
        expect(chunk).to_not be_persisted
        expect(chunk.gcid).to eq(gcid)
        expect(chunk.content).to be_nil
      end
    end
  end

  describe '#create_page' do
    let(:content) { 'CONTENT' }

    it do
      page = factory.create_page(gpid, gcid, content)
      chunk = page.chunk

      aggregate_failures do
        expect(page).to_not be_persisted
        expect(page.gpid).to eq(gpid)
        expect(chunk).to_not be_persisted
        expect(chunk.gcid).to eq(gcid)
        expect(chunk.content).to eq(content)
      end
    end
  end
end
