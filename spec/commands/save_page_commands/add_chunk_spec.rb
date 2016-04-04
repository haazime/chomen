require 'rails_helper'

describe SavePageCommands::AddChunk do
  describe '#run' do
    it do
      SavePageCommands::CreatePage.new('GPID', 'GCID1', 'CHUNK1').run
      page = Page.last

      command = described_class.new(page.gpid, 'GCID2', 'CHUNK2')
      command.run
      chunk = command.result.chunk

      aggregate_failures do
        expect(page.chunks.reload.size).to eq(2)
        expect(chunk.content).to eq('CHUNK2')
      end
    end
  end
end
