require 'rails_helper'

describe 'sort chunk' do
  it do
    page = create_chunks_for_page([
      ['P1', 'C1', 'A'],
      ['P1', 'C2', 'B'],
      ['P1', 'C3', 'C']
    ])
    expect(chunk_contents(page)).to eq(%w(A B C))
  end

  it do
    create_chunks_for_page([
      ['P2', 'C7', 'X'],
      ['P2', 'C8', 'Y'],
      ['P2', 'C9', 'Z']
    ])

    page = create_chunks_for_page([
      ['P1', 'C1', 'A'],
      ['P1', 'C2', 'B'],
      ['P1', 'C3', 'C']
    ])

    move_chunk = Chunk.find_by(gcid: 'C1')
    move_chunk.update(row_order_position: 2)

    expect(chunk_contents(page)).to eq(%w(B C A))
  end

  private

    def chunk_contents(page)
      page.ordered_chunks.map(&:content)
    end

    def create_chunks_for_page(chunks)
      create_page(*chunks.shift).tap do
        chunks.each do |attrs|
          add_chunk(*attrs)
        end
      end
    end
end
