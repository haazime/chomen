require 'rails_helper'

describe SavePageCommands::AddChunk do
  describe '#run' do
    it do
      SavePageCommands::CreatePage.new('GPID', 1, 'CHUNK1').run
      gpid = Page.last.gpid

      command = described_class.new(gpid, 2, 'CHUNK2')
      command.run
      chunk = Chunk.last

      aggregate_failures do
        expect(chunk.number).to eq(2)
        expect(chunk.content).to eq('CHUNK2')
      end
    end
  end
end
