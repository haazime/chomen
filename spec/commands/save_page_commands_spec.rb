require 'rails_helper'

describe SavePageCommands do
  describe '.detect' do
    let(:gpid) { 'GPID' }
    let(:gcid) { 'GCID' }
    let(:content) { 'CONTENT' }

    context 'when no page' do
      it do
        params = { gpid: gpid, gcid: '', number: 1, content: content }
        command = described_class.detect(params)
        expected_command = SavePageCommands::CreatePage.new(gpid, 1, content)
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

    context 'when page and chunk are exist' do
      before { Page.create!(gpid: gpid) }

      it do
        params = { gpid: gpid, gcid: '', number: 2, content: content }
        command = described_class.detect(params)
        expected_command = SavePageCommands::AddChunk.new(gpid, 2, content)
        expect(command).to eq(expected_command)
      end
    end
  end
end
