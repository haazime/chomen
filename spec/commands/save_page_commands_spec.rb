require 'rails_helper'

describe SavePageCommands do
  describe '.detect' do
    let(:gpid) { 'GPID' }
    let(:gcid) { 'GCID' }
    let(:content) { 'CONTENT' }

    context 'when page = NOT exists, chunk = NOT exists' do
      it do
        params = { gpid: gpid, gcid: gcid, content: content }
        command = described_class.detect(params)
        expected_command = SavePageCommands::CreatePage.new(gpid, gcid, content)
        expect(command).to eq(expected_command)
      end
    end

    let(:page) do
      PageFactory.new_page.tap do |page|
        page.chunks.first.content = content
        page.save!
      end
    end

    context 'when page = exists, chunk = exists' do
      let(:chunk) { page.chunks.first }

      it do
        params = { gpid: page.gpid, gcid: chunk.gcid, content: content }
        command = described_class.detect(params)
        expected_command = SavePageCommands::UpdateChunk.new(chunk.gcid, content)
        expect(command).to eq(expected_command)
      end
    end

    context 'when page = exists, chunk = NOT exists' do
      let(:new_chunk) { page.add_new_chunk }

      it do
        params = { gpid: page.gpid, gcid: new_chunk.gcid, content: content }
        command = described_class.detect(params)
        expected_command = SavePageCommands::AddChunk.new(page.gpid, new_chunk.gcid, content)
        expect(command).to eq(expected_command)
      end
    end
  end
end
