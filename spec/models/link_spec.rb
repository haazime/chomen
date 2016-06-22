require 'rails_helper'

describe Link do
  describe '.title' do
    subject do
      described_class.title_extractor = TitleExtractorStub.new(page_title)
      described_class.title(content)
    end

    let(:page_title) { 'the page title' }

    context 'content start_with http://' do
      let(:content) { 'http://example.com' }
      it { is_expected.to eq(page_title) }
    end

    context 'content start_with https://' do
      let(:content) { 'https://example.com' }
      it { is_expected.to eq(page_title) }
    end

    context 'content NOT start_with http' do
      let(:content) { 'http is protocol' }
      it { is_expected.to be_nil }
    end

    context 'content includes \n' do
      let(:content) { "http://example.com\nis awesome" }
      it { is_expected.to be_nil }
    end
  end
end
