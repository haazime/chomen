require 'rails_helper'

describe 'create page', js: true do
  it do
    visit new_page_creation_path
    fill_in 'page_creation[content]', with: 'note'
    form = find('#new_page_creation')
    form.trigger('submit')

    edit_chunk_form = find('#new_chunk_editing')
    content = first('#new_chunk_editing textarea').text
    expect(edit_chunk_form).to_not be_nil
    expect(content).to eq('note')
  end
end
