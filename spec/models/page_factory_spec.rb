require 'rails_helper'

describe PageFactory do
  describe '.new_page' do
    it do
      page = described_class.new_page
      chunk = page.chunks.first

      aggregate_failures do
        expect(page).to_not be_persisted
        expect(page.gpid).to_not be_nil
        expect(chunk).to_not be_persisted
        expect(chunk.gcid).to_not be_nil
        expect(chunk.content).to be_nil
      end
    end
  end
end
