require 'rails_helper'

describe Chunk do
  describe '#destroy_with_page' do
    context 'page = 1, chunk = 1' do
      it do
        page = create_page('GPID', 1, 'CHUNK1')
        chunk = page.chunks.first
        chunk.destroy_with_page

        aggregate_failures do
          expect(Page.find_by_id(page.id)).to be_nil
          expect(Chunk.find_by_id(chunk.id)).to be_nil
        end
      end
    end

    context 'page = 1, chunk = 2' do
      it do
        page = create_page('GPID', 1, 'CHUNK1')
        add_chunk(page.gpid, 2, 'CHUNK2')
        chunk1, chunk2 = page.chunks

        chunk1.destroy_with_page

        aggregate_failures do
          expect(Page.find_by_id(page.id)).to_not be_nil
          expect(Chunk.find_by_id(chunk1.id)).to be_nil
          expect(Chunk.find_by_id(chunk2.id)).to_not be_nil
        end
      end
    end
  end

  describe '#link?' do
    subject do
      Chunk.new(content: content)
    end

    context 'content start_with http://' do
      let(:content) { 'http://example.com' }
      it { is_expected.to be_link }
    end

    context 'content start_with https://' do
      let(:content) { 'https://example.com' }
      it { is_expected.to be_link }
    end

    context 'content NOT start_with http' do
      let(:content) { 'http is protocol' }
      it { is_expected.to_not be_link }
    end

    context 'content includes \n' do
      let(:content) { "http://example.com\nis awesome" }
      it { is_expected.to_not be_link }
    end
  end
end
