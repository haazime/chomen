require 'rails_helper'

describe SavePageCommands::UpdateChunk do
  describe '#run' do
    it do
      SavePageCommands::CreatePage.new('GPID', 'GCID', 'CREATE').run

      command = described_class.new('GCID', 'UPDATE')
      command.run
      chunk = command.result.chunk

      expect(chunk.content).to eq('UPDATE')
    end
  end
end
