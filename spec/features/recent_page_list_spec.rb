require 'rails_helper'

describe 'show recent page list' do
  context 'pages = 1' do
    it do
      create_page('P1', 'C1', 'page a')
      visit root_path
      labels = all('#page-list li').map(&:text)
      expect(labels).to eq(['page a'])
    end
  end

  context 'pages = 1' do
    it do
      create_page('P1', 'C1', 'page a')
      create_page('P2', 'C1', 'page b')
      create_page('P3', 'C1', 'page c')
      create_page('P4', 'C1', 'page d')
      create_page('P5', 'C1', 'page e')
      create_page('P6', 'C1', 'page f')

      visit root_path
      labels = all('#page-list li').map(&:text)
      expect(labels).to eq(
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
end
