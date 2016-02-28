require 'rails_helper'

describe SavePageCommands do
  describe '.detect' do
    it do
      params = { gpid: 'GPID', id: '', content: 'CONTENT' }
      command = described_class.detect(params)
      expected_command = SavePageCommands::CreatePage.new('GPID', 'CONTENT')
      expect(command).to eq(expected_command)
    end

    it do
      params = { gpid: 'GPID', id: '1', content: 'CONTENT' }
      command = described_class.detect(params)
      expected_command = SavePageCommands::UpdateChunk.new('GPID', '1', 'CONTENT')
      expect(command).to eq(expected_command)
    end
  end
end
