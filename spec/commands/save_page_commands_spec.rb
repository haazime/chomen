require 'rails_helper'

describe SavePageCommands do
  describe '.detect' do
    it do
      params = { gpid: '', gcid: 'GCID', content: 'CONTENT' }
      command = described_class.detect(params)
      expected_command = SavePageCommands::CreatePage.new('CONTENT')
      expect(command).to eq(expected_command)
    end

    it do
      params = { gpid: 'GPID', gcid: 'GCID', content: 'CONTENT' }
      command = described_class.detect(params)
      expected_command = SavePageCommands::UpdateChunk.new('GPID', '1', 'CONTENT')
      expect(command).to eq(expected_command)
    end
  end
end
