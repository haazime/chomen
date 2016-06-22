require 'rails_helper'

describe 'link chunk', js: true do
  it do
    Link.title_extractor = TitleExtractorStub.new('title')
    url = 'https://www.google.co.jp/'
    saved_page = create_page('P1', 'C1', url)
    visit edit_page_path(gpid: saved_page.gpid)
    link = chunk_box(0).first('.chunk-link')
    expect(link[:href]).to eq(url)
  end
end
