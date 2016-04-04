require 'rails_helper'

describe SavePageCommands::CreatePage do
  describe '#run' do
    it do
      command = described_class.new('GPID', 'GCID', 'CHUNK')
      command.run
      page = command.result.page
      chunk = command.result.chunk

      aggregate_failures do
        expect(page.gpid).to eq('GPID')
        expect(chunk.gcid).to eq('GCID')
        expect(chunk.content).to eq('CHUNK')
      end
    end
  end
end
