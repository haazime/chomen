require 'rails_helper'

describe SavePageCommands::UpdateChunk do
  describe '#run' do
    it do
      SavePageCommands::CreatePage.new('GPID', 1, 'CREATE').run
      gcid = Chunk.last.gcid

      command = described_class.new(gcid, 'UPDATE')
      command.run
      chunk = Chunk.last

      expect(chunk.content).to eq('UPDATE')
    end
  end
end
