require 'rails_helper'

describe SavePageCommands do
  describe '.detect' do
    let(:gpid) { 'GPID' }
    let(:gcid) { 'GCID' }
    let(:content) { 'CONTENT' }

    context 'when no page' do
      it do
        params = { gpid: gpid, gcid: '', content: content }
        command = described_class.detect(params)
        expected_command = SavePageCommands::CreatePage.new(gpid, content)
        expect(command).to eq(expected_command)
      end
    end

    context 'when page is exists' do
      before { Page.create!(gpid: gpid) }

      it do
        params = { gpid: gpid, gcid: gcid, content: content }
        command = described_class.detect(params)
        expected_command = SavePageCommands::UpdateChunk.new(gcid, content)
        expect(command).to eq(expected_command)
      end
    end
  end
end
