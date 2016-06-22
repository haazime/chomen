require 'rails_helper'

describe 'show recent page list' do
  context 'pages = 5' do
    it do
      create_page('P1', 'C1', 'page a')
      create_page('P2', 'C2', 'page b')
      create_page('P3', 'C3', 'page c')
      create_page('P4', 'C4', 'page d')
      create_page('P5', 'C5', 'page e')

      visit root_path
      expect(recent_pages.size).to eq(5)
    end
  end

  context 'pages = 6' do
    it do
      create_page('P1', 'C1', 'page a')
      create_page('P2', 'C1', 'page b')
      create_page('P3', 'C1', 'page c')
      create_page('P4', 'C1', 'page d')
      create_page('P5', 'C1', 'page e')
      create_page('P6', 'C1', 'page f')

      visit root_path
      expect(recent_page_labels).to eq(
        [
          'page f',
          'page e',
          'page d',
          'page c',
          'page b',
        ]
      )
    end
  end

  private

    def recent_page_labels
      recent_pages.map(&:text)
    end

    def recent_pages
      all('.recent-page')
    end
end
