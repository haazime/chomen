require 'rails_helper'

describe SavePageCommands::AddChunk do
  describe '#run' do
    it do
      SavePageCommands::CreatePage.new('GPID', 'CHUNK1').run
      gpid = Page.last.gpid

      command = described_class.new(gpid, 'CHUNK2')
      command.run
      chunk = Chunk.last

      expect(chunk.content).to eq('CHUNK2')
    end
  end
end
